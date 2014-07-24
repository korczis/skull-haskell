module Cli.Cli (prompt) where

import Control.Monad

prompt :: (Read a) => String -> IO a
prompt s = putStr s >> getLine >>= return . read