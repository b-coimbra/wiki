import Data.List (nub)

filter (<5) [1..10]

map (++ "!") ["hey", "good", "yep"]

sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
-- with function composition
sum . takeWhile (<10000) . filter odd . map(^2) $ [1..]
-- or (list comprehension)
sum . takeWhile (<10000) $ [n^2 | n <- [1..], odd (n^2)]

chain :: (Int a) => a -> [a]
chain 1 = [1]
chain n | even n = n:chain (n `div` 2)
        | odd n  = n:chain (n*3 + 1)

length (takeWhile (<1000) $ foldl (+) 0 map sqrt [1..]) + 1

sum (takeWhile (<100) (map sqrt [1..]))

sum $ takeWhile (<100) [sqrt x | x <- [1..]]

sum (filter (>10) (map (*2) [2..20]))

sum [x*2 | x <- [2..20], x > 10]

sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs

intercalate " " ["hey", "what's", "up"]

intersperse '.' "wtf"
