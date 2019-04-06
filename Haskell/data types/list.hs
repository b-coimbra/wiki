import System.IO
import Data.List

multi = [x * 4 | x <- [1..20]] -- multiply list by 4

powList = [4^x | x <- [1..20]] -- iterate list by power of 4

multTable = [[x * y | x <- [1..10]] | y <- [1..10]]

list1 = [2,1,4,3,5]

[1,2,3,4] !! 1 -- => 2

list2 = list1 ++ [7,6,9,8]

sumlist = zipWith (+) list1 list2

sortlist = sort list2

multList = foldl (*) 1 list2 -- foldl (starts on the left), foldr (starts on the right)

isEven = [x | x <- [1..10], x `mod` 2 == 0] -- use `mod` (infix) instead of %

evenUpto = takeWhile (<= 10) [2,4..]

names = ["John", "Bob", "Mary"]
ages = ["20", "32", "41"]

info = zip names ages -- zip : combine lists
