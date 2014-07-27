{-# LANGUAGE TypeOperators #-}

-- See http://community.haskell.org/~simonmar/slides/cadarache2012/7%20-%20accelerate.pdf

module Parallel.Parallel where

import Data.Array.Accelerate as A
import Data.Array.Accelerate.Interpreter as I

-- data Z = Z
-- data tail :. head = tail :. head

-- type DIM0 = Z
-- type DIM1 = DIM0 :. Int
-- type DIM2 = DIM1 :. Int
-- type Scalar e = Array DIM0 e
-- type Vector e = Array DIM1 e

run :: Arrays a => Acc a -> a
run = I.run

testVector :: Vector Int
testVector = fromList (Z:.100) [1..100] :: Vector Int

testMatrix :: Array DIM2 Int
testMatrix = fromList (Z:.100:.100) [1..] :: Array DIM2 Int

-- testTuples :: Array DIM2 (Int, Char)
-- testTuples = fromList (Z:.2:.3) (A.zip [1..] ['a'..]) :: Array DIM2 (Int,Char)

res :: Scalar Int
res = Parallel.Parallel.run $ A.sum $ A.map (+1) (use testMatrix) 
