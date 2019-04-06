
[1..10] >>= (\x -> [x * 2])

map (\x -> x * 2) [1..10]

map (\x -> foldr (*) 2 [x]) [1..10]

map (*2) [1..10]

[x * 2 | x <- [1..10]]

[(*2)] <*> [1..10]

(*2) <$> [1..10]


lengths :: [Int]
lengths [] = []

length' :: Num b => [a] -> b
length' [] = 1
length' (_:xs) = lengths ++ [1 + length' xs]

-- 1
fib :: Int -> Int
fib n
    | n <= 1    = n
    | otherwise = fib (n-1) + fib (n-2)

-- 2
let fib = 0 : 1 : zipWith (+) (tail fib)
take 10 fib

-- 3
let fib = 0 : scanl (+) 1 fib
take 10 fib
