justify4 :: Justifier
justify4 = hyphenated fragments'

fragments' :: String -> [(String, String)]
fragments' s0 = (map go . init . tail) (zip (inits s0) (tails s0)) where
  go (h, t) = (h ++ "-", t)

hyphenated :: (String -> [(String, String)]) -> Justifier
hyphenated hyphenator = padWords justifier where
  justifier width sizes iota = go ([], 0) where
    go ([], _) (w:ws) = go ([w], fromMaybe 0 (lookup w sizes)) ws
    go (sofar, len) (w:ws)
      | fits len w = go (w:sofar, len + iota + fromMaybe 0 (lookup w sizes)) ws
      | otherwise = case dropWhile (not . fits len . fst) . sortOn (Down . length . fst) $ hyphenator w of
          ((h,t):_)  -> case reverse (h:sofar) of
            (word:rest) -> toLine word rest : go ([], 0) (t:ws)
            _ -> error "unreachable"
          [] -> case reverse sofar of
            (word:rest) -> toLine word rest : go ([], 0) (w:ws)
            [] -> Line w [] : go ([], 0) ws
    go (sofar, _) [] = case reverse sofar of
      (word:rest) -> [toLine word rest]
      [] -> []

    fits len w = len + iota + fromMaybe 0 (lookup w sizes) <= width

    toLine word rest = Line word [(iota, s) | s <- rest]

    justify6 :: Justifier
    justify6 = leastBad justifier where
      justifier width sizes iota = map (padWords' width sizes) . go ([], 0) where
        go ([], _) (w:ws) = go ([w], fromMaybe 0 (lookup w sizes)) ws
        go (sofar, len) (w:ws)
          | fits len w = go (w:sofar, len + iota + fromMaybe 0 (lookup w sizes)) ws
          | otherwise =
            (case reverse sofar of
               (word:rest) -> [toLine word rest : ls | ls <- go ([], 0) (w:ws)]
               [] -> [toLine w [] : ls | ls <- go ([], 0) ws])
            ++
            [ toLine word rest : ls
              | (h,t) <- knuthHyphenator w
              , fits len h
              , let (word:rest) = reverse (h:sofar)
              , ls <- go ([], 0) (t:ws)
            ]
        go (sofar, _) [] = case reverse sofar of
          (word:rest) -> [[toLine word rest]]
          [] -> [[]]

        fits len w = len + iota + fromMaybe 0 (lookup w sizes) <= width

        toLine word rest = Line word [(iota, s) | s <- rest]

    leastBad :: (Int -> [(String, Int)] -> Int -> [String] -> [[Line]]) -> Justifier
    leastBad justifier width sizes iota ws = case sortOn badness (justifier width sizes iota ws) of
        (leastBad:_) -> leastBad
        [] -> []
      where
        -- the badness of a paragraph is the pair @(sum of line badnesses,
        -- number of hyphenated lines)@.
        badness ls =
          let
            -- the badness of a line is the difference between the biggest
            -- space and the smallest possible space, raised to the third
            -- power. This is nonlinear so that one particularly bad line
            -- is worse than a few slightly bad lines.
            lbadness (Line _ rest) = (maximum (iota : map fst rest) - iota) ^ 3
            lhyphenated (Line w rest) = last (last (w : map snd rest)) == '-'
          in (sum (map lbadness ls), length (filter lhyphenated ls))

          type RichText = [(String, Font)]

          -- | Font styles.
          data Font = Normal | Bold | Italic | Monospace
            deriving (Bounded, Enum, Eq, Ord, Read, Show)

          -- | Get the size of every word in a string, font-aware.
          getWordSizes :: RichText -> IO [((String, Font), Int)]
          getWordSizes = fmap (nub . concat) . mapM go where
            go w@(_, Monospace) = do
              size <- getStringSize w
              pure [(w, size)]
            go (s, f) =
              let wsize w = let wf = (w, f) in getStringSize wf >>= \size -> pure (wf, size)
              in mapM wsize (concatMap fragments (words s))

          -- | Get the size of a string.
          getStringSize :: (String, Font) -> IO Int
          getStringSize (s, f) = do
            ((x1,_), _, (x2,_), _) <- GD.measureString (fontName f) fontSize 0 (0, 0) s 0
            pure (x2-x1)


          indentsAndLineLengths
            :: (Int -> (Int, Int))
            -- ^ Argument is the line number (starting from 0). First result is
            -- the left indent, second is the line length.
            -> (Paragraph -> Paragraph)
            -- ^ Post-processing function.
            -> Justifier
          indentsAndLineLengths lenf postf _ sizes iota = leastBad iota . map postf . go 0 ([], 0) . concatMap pre where
            -- pre-processing: split up spans into words
            pre w@(_, Monospace) = [w]
            pre (s, f) = [(s', f) | s' <- words s]

            go n ([], _) (w:ws) = go n ([w], wordSize sizes w) ws
            go n (sofar, len) (w:ws)
              | fits n len w = go n (w:sofar, len + iota + wordSize sizes w) ws
              | otherwise =
                (case reverse sofar of
                   (word:rest) -> [toLine n word rest : ls | ls <- go (n+1) ([], 0) (w:ws)]
                   [] -> [toLine n w [] : ls | ls <- go (n+1) ([], 0) ws])
                ++
                [ toLine n word rest : ls
                  | (h,t) <- hyphens w
                  , fits n len h
                  , let (word:rest) = reverse (h:sofar)
                  , ls <- go (n+1) ([], 0) (if null (fst t) then ws else (t:ws))
                ]
            go n (sofar, _) [] = case reverse sofar of
              (word:rest) -> [[toLine n word rest]]
              [] -> [[]]

            fits n len w = len + iota + wordSize sizes w <= snd (lenf n)

            toLine n (w,f) rest = (fst (lenf n), w, f):|[(iota, s, f') | (s, f') <- rest]

            hyphens (w, Monospace) = [((w, Monospace), ("", Monospace))] -- never hyphenate monospaced spans
            hyphens (w, f) = map (\(h,t) -> ((h,f),(t,f))) (knuthHyphenator w)
