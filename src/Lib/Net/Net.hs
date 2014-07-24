module Net.Net (allIps, allIpsStrings) where

allIps :: [(Int, Int, Int, Int)]
allIps = [(a, b, c, d) | a <- [0..255], b <- [0..255], c <- [0..255], d <- [0..255]]

allIpsStrings :: [String]
allIpsStrings = [show a ++ "." ++ show b ++ "." ++ show c ++ "." ++ show d | a <- [0..255], b <- [0..255], c <- [0..255], d <- [0..255]]
