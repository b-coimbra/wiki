import System.Process
import Control.Monad (forever)

data Command = Exec String deriving (Show)

lsCommand :: Command -> IO String
lsCommand (Exec cmd) = readCreateProcess (shell cmd) ""

main = forever $ do
  putStr "> "
  line <- getLine
  if (line /= "quit") then
    lsCommand (Exec line)
    else error "Quit"
