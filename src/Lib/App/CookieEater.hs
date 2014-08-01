module App.CookieEater where

import qualified Cli.Cli as Cli

checkCookie :: String -> Bool
checkCookie x = x == "cookie"

done :: IO ()
done = do
	Cli.say "Done"

ask :: IO ()
ask = do
	Cli.say "Give me a cookie"
	cookie <- getLine
	if checkCookie cookie then Cli.say "Thanks" else ask
	
run :: IO ()
run = do
	ask
