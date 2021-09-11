import System.IO
import Data.List

isEven :: Int -> Bool

isEven n
     | n `mod` 2 == 0 = True
     | otherwise = False

-- or isEven n = n `mod` 2 == 0

isOdd x = x `mod` 2 == 1 -- if remainder of x is equal to 1

-----------------------

canDrive :: Int -> String

canDrive age
       | (age >= 14) && (age <= 15) = "almost there"
       | (age >= 16) = "can drive!"
       | (age < 14) = "too young!"
       | otherwise = "invalid age?"
