fib :: Int -> Int
fib n
    | n <= 1    = n
    | otherwise = fib (n-1) + fib (n-2)

fact :: Int -> Int
fact n
    | n <= 1 = 1
    | otherwise = n * fact (n-1)