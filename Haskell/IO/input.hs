import System.IO
import Data.List
import Data.Char

main :: IO ()
main = do
    putStr "wot is ur name¿ "
    name <- getLine
    if null name
        then do
            putStrLn "say your name!"
            main
        else do
            putStrLn $ "howdy " ++ map toUpper name
