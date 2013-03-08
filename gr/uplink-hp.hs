{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}
-- uplink (jmcc)

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.UGen.Monad.Syntax
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: UId m => UGen -> m UGen
rand2 n = rand (-n) n

randz :: UId m => UGen -> m UGen
randz = rand 0

uplink :: UId m => m UGen
uplink = do
  let p0 = do return (lfPulse KR #(randz 20) 0 #(randz 1))
  let p1 = do return (lfPulse KR #(randz 4) 0 #(randz 1) * #(randz 8000) + #(randz 2000))
  f <- fmap mix (clone 2 (p0 .*. p1))
  return (pan2 (lfPulse AR f 0 0.5 * 0.04) #(rand2 0.8) 1)

main :: IO ()
main = overlapTextureU (4,1,5,maxBound) =<< uplink
