module App.FastPing where

import qualified Cli.Cli as Cli

run :: IO ()
run = do
	Cli.say "This is FastPing "
