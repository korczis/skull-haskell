module Algs.Algs where

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

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	let smallerSorted = quicksort [a | a <- xs, a < x]
	    biggerSorted = quicksort [a | a <- xs, a > x]
	in smallerSorted ++ [x] ++ biggerSorted
