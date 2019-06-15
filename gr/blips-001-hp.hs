-- blips 001 (jmcc) #SC3d1.5
{-# OPTIONS_GHC -F -pgmF hsc3-hash-paren #-}

import Sound.SC3 as SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

blips_001 :: UId m => m UGen
blips_001 = do
  let c = #(randM 0 1) `less_than` 0.8
  let b = do
        let f = xLine KR #(expRandM 0.25 400) #(expRandM 0.25 400) 4 DoNothing
        let nh = xLine KR #(expRandM 2 100) #(expRandM 2 100) 4 DoNothing
        return (blip AR f nh)
  return (c * pan2 (#(b) * #(b)) (line KR #(rand2M 1) #(rand2M 1) 4 DoNothing) 0.3)

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
main = O.overlapTextureU (2,1,12,maxBound) =<< blips_001
