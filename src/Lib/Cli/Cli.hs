module Cli.Cli (listen, prompt, say)  where

import Control.Monad

listen :: IO String
listen = getLine

prompt :: (Read a) => String -> IO a
prompt s = putStr s >> getLine >>= return . read

say :: String -> IO ()
say x = putStrLn x