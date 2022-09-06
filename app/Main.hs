module Main (main) where

import System.Environment
-- import System.Dictionary
import Data.List
import GHC.IO.Handle
import Control.Monad(when) 
import qualified Data.ByteString.Lazy as B  
import qualified Data.ByteString as S 
-- import Lib

-- getLines :: String -> [String]
-- getLines fileName = do
--     handle <- openFile fileName ReadMode
--     contents <- hGetContents handle
--     let lns = lines contents
--     putStrLn (lns !! 1) 
    -- hClose handle

copyFile :: FilePath -> FilePath -> IO ()  
copyFile source dest = do  
    contents <- B.readFile source  
    B.writeFile dest contents  
    

countWords :: String -> IO()
countWords path = do
    -- let path = "/home/malandr/Documents/lorem.txt"
    contents <- readFile path
    let liness = words contents
    -- map (\l -> putStrLn l) liness 
    -- putStrLn (show (length liness))
    -- mapM_ print liness
    length liness


main :: IO ()
main = do
    let path = "/home/malandr/Documents/lorem.txt"
    -- [1,2..10] map
        countWords path
    
    