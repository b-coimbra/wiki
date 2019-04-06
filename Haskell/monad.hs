excl :: [String] -> String
excl w = unwords $ map (++ "!") w

main :: IO ()
main = putStrLn $ excl ["hey", "there"]
  -- putStr "name: "
  -- name <- getLine
  -- putStrLn $ "hello " ++ addExclamation name
