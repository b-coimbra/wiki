import System.Environment
import System

main = do
    args <- getArgs
    print args
    system "pause"
    -- ghc -o args args.hs
    -- ./args hello world => ["hello", "world"]
