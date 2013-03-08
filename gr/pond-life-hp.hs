{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- pond life (jmcc)

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.UGen.Monad.Syntax
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: UId m => UGen -> m UGen
rand2 n = rand (-n) n

pond_life :: UId m => m UGen
pond_life = do
  f0 <- 20 +. rand 0 30
  f1 <- fSinOsc KR f0 0 *. rand 100 400 .+. linRand 500 2500 0
  let a = lfPulse KR (3 / #(rand 1 9)) #(rand 0.2 0.5) 0.04
  return (pan2 (sinOsc AR f1 0 * a) #(rand2 1) 0.5)

main :: IO ()
main = overlapTextureU (8,8,4,maxBound) =<< pond_life
