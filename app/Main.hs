module Main (main) where

import System.Environment
import Data.List
import GHC.IO.Handle
-- import Lib

-- getLines :: String -> [String]
-- getLines fileName = do
--     handle <- openFile fileName ReadMode
--     contents <- hGetContents handle
--     let lns = lines contents
--     putStrLn (lns !! 1) 
    -- hClose handle

main :: IO ()
main = do
    -- [1,2..10] map
    let path = "/home/malandr/Documents/lorem.txt"
    contents <- readFile path
    let liness = words contents
    -- map (\l -> putStrLn l) liness 
    putStrLn (show (length liness))
    