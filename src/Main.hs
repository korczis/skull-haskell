module Main where

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

-- apply function to param and get result
-- see: http://learnyouahaskell.com/higher-order-functions
apply' :: (a -> a) -> a -> a
apply' f x = f (x)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f ( f (x ))

bmiCalc :: (RealFloat a) => a -> a -> a
bmiCalc weight height = weight / height ^ 2

bmiTell1 :: (RealFloat a) => a -> a -> String  
bmiTell1 weight height  
	| weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"  
	| weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"  
	| weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"  
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
charName x = "Bad luck"

cookieEater :: String -> String
cookieEater cookie
	| cookie == "cookie" = "Yummi"
	| otherwise = "Not a cookie!"

elem' :: (Eq a) => a -> [a] -> Bool
elem' e [] = False
elem' e (x:xs) = if e == x then True else elem' e xs

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

factorialproduct :: (Integral a) => a -> a
factorialproduct x = product [1..x]

foldl' _ z _ = z
foldl' f z (x:xs) = let z' = z `f` x
                    in seq z' $ foldl' f z' xs

length' :: [a] -> Integer
length' [] = 0
length' x = 1 + (length' (tail x))

maximum' :: (RealFloat a) => [a] -> a
maximum' [] = error "Maximum on empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

nth :: (Num a, Ord a) => a -> [b] -> b
nth x xs = if x - 1 == 0 
	then head xs 
	else nth (x - 1) (tail xs) 

nthback :: Int -> [b] -> b
nthback a xs = nth a (reverse xs)

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let smallerSorted = quicksort [a | a <- xs, a < x]
	    biggerSorted = quicksort [a | a <- xs, a > x]
	in smallerSorted ++ [x] ++ biggerSorted

repeat' :: a -> [a]
repeat' x = x:repeat' x

replicate' :: (Num a, Ord a) => a -> b -> [b]
replicate' n _
	| n <= 0 = [] 
replicate' n x = [x] ++ (replicate' (n-1) x)

reverse' :: String -> String
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]


sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:[]) = x
sum' (x:xs) = x + (sum' xs)

take' :: (Ord a, Num a) => a -> [a] -> [a]
take' n _
	| n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

tell :: (Show a) => [a] -> String
tell [] = "I see empty list!"
tell (_:[]) = "Just one item?"
tell (_:_:[]) = "Two items are just right."
tell (_:_:_) = "Too many items for me!"

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : (zip' xs ys)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

main :: IO()
main = do
  putStrLn "Hello World"
