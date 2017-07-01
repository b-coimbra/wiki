-- head
head' :: [a] -> a
head' [] = error "empty list"
head' (x:_) = x
-- or
head'' :: [a] -> a
head'' xs = case xs of []    -> error "empty list"
                       (x:_) -> x

-- length
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs
{-
    length' [1,2,3]

    1 + (length [2,3])
    1 + (1 + (length [3]))
    1 + (1 + (1 + []))
    1 + (1 + (1 + 0))
    = 3
-}

-- sum
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs
{-
    sum [1,2,3]

    1 + (sum [2,3])
    1 + (2 + ([3]))
    1 + (2 + (3 + []))
    1 + (2 + (3 + 0))
    = 6
-}

-- reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]
{-
    reverse' [3,2,1]
    [2,1] ++ 3 => [2,1,3] => [1,2,3]
-}

-- fst snd trd
trd :: (a, b, c) -> c
trd (_, _, z) = z

-- max
max' :: (Ord a) => a -> a -> a
max' a b = if a > b then a else b
{- or
max' a b
    | a > b     = a
    | otherwise = b
-}

--maximum
maximum' :: (Ord a) => [a] -> a
maximum' []  = error "empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise   = maxTail
    where maxTail = maximum' xs
-- or
maximum'' (x:xs) = max x (maximum'' xs)

-- replicate
replicate' :: (Num i, Ord i) => i -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x:replicate' (n-1) x
{- 
    replicate' 3 6

    6:replicate' (3-1) 6
    [6] replicate' (2-1) 6
    [6,6] replicate' (1-1) 6
    [6,6,6] replicate' (0)
    [6,6,6]
-}

--take
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <= 0   = []
take' _ []     = []
take' n (x:xs) = x : take' (n-1) xs
{-
    take' 3 [4,3,2,1]

    [4] (3-1) [3,2,1]
    [4,3] (2-1) [2,1]
    [4,3,2] (1-1) [1]
    [4,3,2] 0 []
    [4,3,2]
-}

-- repeat
repeat' :: a -> [a]
repeat' x = x:repeat' x
{-
    repeat' 6

    6:repeat' 6
    6:6:repeat' 6
    ...
-}

-- zip
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys
{-
    zip' [1,2,3] [2,3]

    1:2:zip' [2,3] [3]
    [(1,2),(2,3)]:zip' [3] [3]
    [(1,2),(2,3),(3,3)]:zip' [] []
    [(1,2),(2,3),(3,3)]
-}

-- elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x    = True
    | otherwise = a `elem'` xs

{-
    elem' 3 [1,2,3]

    3 != 1 => [2,3]
    3 != 2 => [3]
    3 == 3 => True
    True
-}

-- quicksort

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort [a | a <- xs, a <= x]
        biggerSorted  = quicksort [a | a <- xs, a > x]
    in smallerSorted ++ [x] ++ biggerSorted
{-
    quicksort [3,4,6,5,2,1]
               ^--- pivot

    [4,6,5] ++ [3] ++ [2,1]
    
    [6] ++ [4] ++ [5]
     ^------^ (left side must be smaller, swap)
    [4] ++ [6] ++ [5]
            ^------^ (swap)
    [4] ++ [5] ++ [6]
    [4,5,6] ++ [3] ++ [2,1]
                [3,2,1]
                [2] ++ [3] ++ [1]
                        ^------^ (swap)
                [2,1,3]
                    [2] ++ [1] ++ [3]
                     ^------^ (swap)
                    [1,2,3]
    [4,5,6] ++ [1,2,3]
    ^----------------^ (swap)
    [1,2,3] ++ [4,5,6]
    [1,2,3,4,5,6]
-}