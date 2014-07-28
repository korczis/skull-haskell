module App.CookieEater where

import qualified Cli.Cli as Cli

checkCookie :: String -> Bool
checkCookie x = x == "cookie"

ask :: IO ()
ask = do
	Cli.say "Give me a cookie"
	cookie <- getLine
	Cli.say $ show $ checkCookie cookie
	
run :: IO ()
run = do
	ask
