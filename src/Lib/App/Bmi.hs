module App.Bmi where

import Cli.Cli
import Playground.Playground

run :: IO()
run = do
	say "What is your weight in kilograms?"
	weight <- getLine
	say ("Ok, your weight is " ++ weight ++ " kilograms")

	say "What is your height in meters? "
	height <- getLine
	say ("Ok, your height is " ++ height ++ " meters")
	
	let res = (bmiCalc (read weight) (read height) :: Float)

	say ("bmiCalc " ++ height ++  " " ++ weight ++ " = " ++ show res)
	say (bmiJustTel res)
