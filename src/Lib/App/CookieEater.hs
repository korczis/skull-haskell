module App.CookieEater where

import qualified Cli.Cli as Cli

checkCookie :: String -> Bool
checkCookie x = x == "cookie"

done :: IO ()
done = do
	Cli.say "Done"

ask :: IO ()
ask = do
	-- Ask user for cookie
	Cli.say "Give me a cookie"

	-- Store user's input in cookie variable
	cookie <- getLine

	-- If user found the cookie print "Thanks" then
	if checkCookie cookie then 
		Cli.say "Thanks" 
	-- IF not ask user again
	else 
		Cli.say "Not a cookie I wanted";
		ask
	
run :: IO ()
run = do
	ask
