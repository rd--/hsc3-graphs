-- clustered sines (jmcc) #2

import Control.Monad {- base -}

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

-- > fmap synthstat (clone 2 cs)
cs :: UId m => m UGen
cs = do
  let n = 80
  f1 <- randM 100 1100
  let f2 = 4 * f1
  y <- replicateM n (f1 +. randM 0 f2)
  let sp = klangSpec y (map (f1 /) y) (replicate n 0)
  return (klang AR 1 0 sp * (0.3 / fromIntegral n))

main :: IO ()
main = O.xfadeTextureU (4,4,maxBound) =<< clone 2 cs
