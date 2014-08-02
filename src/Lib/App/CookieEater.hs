module App.CookieEater where

import qualified Cli.Cli as Cli

-- Checks if user passed right cookie
checkCookie :: String -> Bool
checkCookie x = x == "cookie"

-- Congratulates user
done :: IO ()
done = do
	Cli.say "Thank you"

-- Recursive helper function asking user for cookie
ask :: IO ()
ask = do
	-- Ask user for cookie
	Cli.say "Give me a cookie"

	-- Store user's input in cookie variable
	cookie <- getLine

	check checkCookie cookie done ask

-- Use use function specified as first param for checking if second param is true.
-- If so, call function which is specified as third param else call function specified as fourth param.
check :: (String -> Bool) -> String -> IO () -> IO () -> IO ()
check f x a b = if f x then a else b

-- One tick of application loop
tick :: IO ()
tick = do
	ask

-- Application loop
loop :: IO ()
loop = do
	tick

-- Application entry point
run :: IO ()
run = do
	loop
