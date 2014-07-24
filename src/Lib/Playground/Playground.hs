module Playground.Playground where

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

bmiCalc :: (RealFloat a) => a -> a -> a
bmiCalc weight height = weight / height ** 2

bmiTell1 :: (RealFloat a) => a -> a -> String  
bmiTell1 weight height  
	| weight / height ** 2 <= 18.5 = "You're underweight, you emo, you!"  
	| weight / height ** 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
	| weight / height ** 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
	| otherwise                 = "You're a whale, congratulations!"  

bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
	| bmi <= 18.5 = "You're underweight, you emo, you!"  
	| bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= 30.0    = "You're fat! Lose some weight, fatty!"
	| otherwise     = "You're a whale, congratulations!"
	where bmi = bmiCalc weight height

bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height
	| bmi <= skinny = "You're underweight, you emo, you!"  
	| bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= fat    = "You're fat! Lose some weight, fatty!"
	| otherwise     = "You're a whale, congratulations!"
	where bmi = bmiCalc weight height
	      skinny = 18.5
	      normal = 25.0
	      fat    = 30.0

bmiTell4 :: (RealFloat a) => a -> a -> String
bmiTell4 weight height
	| bmi <= skinny = "You're underweight, you emo, you!"  
	| bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
	| bmi <= fat    = "You're fat! Lose some weight, fatty!"
	| otherwise     = "You're a whale, congratulations!"
	where bmi = bmiCalc weight height
	      (skinny, normal, fat) = (18.5, 25.0, 30.0)

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell = bmiTell4

bmis :: (RealFloat a) => [(a, a)] -> [a]
bmis xs = [bmiCalc w h | (w, h) <- xs]

bmisTell :: (RealFloat a) => [(a, a)] -> [String]
bmisTell xs = [bmi w h | (w, h) <- xs] 
	where bmi = bmiTell

charName :: Char -> String
charName 'a' = "Alan"
charName 'b' = "Bob"
charName 'c' = "Caroline"
charName 'd' = "Don"
charName _ = "Bad luck"

cookieEater :: String -> String
cookieEater cookie
	| cookie == "cookie" = "Yummi"
	| otherwise = "Not a cookie!"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

factorialproduct :: (Integral a) => a -> a
factorialproduct x = product [1..x]

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

nth :: (Num a, Ord a) => a -> [b] -> b
nth x xs = if x - 1 == 0 
	then head xs 
	else nth (x - 1) (tail xs) 

nthback :: Int -> [b] -> b
nthback a xs = nth a (reverse xs)
