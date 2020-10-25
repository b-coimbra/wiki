import Data.List

menu :: Int -> String

menu opt = case opt of
    1 -> "Add"
    2 -> "Remove"
    3 -> "Edit"
    4 -> "View"
    _ -> "Invalid option"