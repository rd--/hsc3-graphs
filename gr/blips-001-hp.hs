-- blips 001 (jmcc) #SC3d1.5
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3.Monad {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

rand2 :: UId m => UGen -> m UGen
rand2 n = rand (-n) n

blips_001 :: UId m => m UGen
blips_001 = do
  let c = #(rand 0 1) <* 0.8
  let b = do
        let f = xLine KR #(expRand 0.25 400) #(expRand 0.25 400) 4 DoNothing
        let nh = xLine KR #(expRand 2 100) #(expRand 2 100) 4 DoNothing
        return (blip AR f nh)
  return (c * pan2 (#(b) * #(b)) (line KR #(rand2 1) #(rand2 1) 4 DoNothing) 0.3)

{-
iter_m :: (Monad m, Num a, Ord a) => (b -> m b) -> a -> b -> m b
iter_m f n st = if n > 0 then iter_m f (n - 1) =<< f st else return st

postProcess :: UId m => UGen -> m UGen
postProcess z = do
  let z' = distort z
      f x = do
        return (allpassN x 0.05 (mce2 #(rand 0 0.05) #(rand 0 0.05)) 4)
  iter_m f 6 z'
-}

main :: IO ()
main = overlapTextureU (2,1,12,maxBound) =<< blips_001

