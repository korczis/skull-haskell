module Helper.Random where

import qualified SkullHaskell.Cli.Cli as Cli

import System.Random

rollDice :: IO Int
rollDice = getStdRandom (randomR (1,6))

playRollDiceGame :: IO ()
playRollDiceGame = do
  Cli.prompt "Whats your choice? "