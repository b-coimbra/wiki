isEven = (\x -> [y | y <- x, y `mod` 2 == 0]) :: [Int] -> [Int]

main = do
    print ((\x -> x + 1) 5) -- 6
    print ((\x y -> x `mod` y) 10 9) -- 1
    print ((\x -> if x <= 5 then x * x else x) 3) -- 9
    print $ isEven [1..20]