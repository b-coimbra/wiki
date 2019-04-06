name :: [Char] -> String
name n = (++) "Hello " n

main :: IO ()
main = do
    name <- getLine

    putStrLn $ concat["Hello ", name]