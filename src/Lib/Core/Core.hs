module Core.Core where

-- apply function to param and get result
-- see: http://learnyouahaskell.com/higher-order-functions
apply' :: (a -> a) -> a -> a
apply' f x = f (x)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f ( f (x ))

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' e (x:xs) = if e == x then True else elem' e xs

foldl' :: (a -> a -> a) -> a -> [a] -> a
foldl' _ z [] = z
foldl' f z (x:xs) = let z' = z `f` x
                    in seq z' $ foldl' f z' xs
length' :: [a] -> Integer
length' [] = 0
length' x = 1 + (length' (tail x))

maximum' :: (RealFloat a) => [a] -> a
maximum' [] = error "Maximum on empty list"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

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

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : (zip' xs ys)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
