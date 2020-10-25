import System.IO
import Data.List

johnDoe = ("John Doe", 20)

getName = fst johnDoe -- fst (first item of tuple)
getAge = snd johnDoe -- snd (second item of tuple)

zip [1..5] ["one", "two", "three", "four", "five"] -- [(1, "one"), ("2","two")..]
-- or
zip [1..] ["one", "two", "three", "four", "five"] -- where [1..] matches the length of the list
