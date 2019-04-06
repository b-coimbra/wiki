import System.IO
import Data.List

add :: Int -> Int -> Int -- if not defined, every other data works

add x y = x + y -- add 20 30 => 50

times :: Int -> Int

times x = x * x -- times 3 => 9

listTimes = map times [1,2,3,4]

map (\x -> x * x) [1,2,3,4]

------------------

addTuple :: (Int, Int) -> (Int, Int) -> (Int, Int)
addTuple (x, y) (x2, y2) = (x + x2, y + y2) -- addTuple (10,15) (5, 30) => (15,45)

------------------

getAge :: Int -> String

getAge 16 = "can drive!"
getAge 14 = "can't drive :("
getAge _ = "?" -- _ can be used as empty variable

------------------

factorial :: Int -> Int

factorial 0 = 1 -- because 0 * factorial(0 - 1) == 1
factorial x = x * factorial (x - 1) -- factorial 3 => 3 * factorial(2) => 6 (factorial is recursive)

-- or use the "product" method:

getFactorial x = product [1..x] -- getFactorial 3 => 6

-----------------

getFirstLetter :: String -> String

getFirstLetter all@(x:xs) = "first letter of " ++ all ++ " is " ++ [x]

-----------------

listItems :: [Int] -> String

listItems [] = "empty list"

listItems (x:[]) = "list starts with" ++ show x -- show x formats into string

listItems (x:y:[]) = "first: " ++ show x ++ "second: " ++ show y

listItems (x:xs) = "first item: " ++ show x ++ ", rest of list: " ++ show xs
