-- bowed string (jmcc)

import Control.Monad
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Monadic {- hsc3 -}

bowed_string :: UId m => m UGen
bowed_string = do
  let root = 5
      scale = map (+ root) [0,2,4,5,7,9,11]
      oct = [24,36,48,60,72,84]
  n0 <- clone 2 (brownNoise AR)
  r0 <- expRand 0.125 0.5
  r1 <- rand 0.7 0.9
  r2 <- sequence (replicate 12 (rand 1.0 3.0))
  f <- liftM midiCPS (liftM2 (+) (choose scale) (choose oct))
  n1 <- lfNoise1 KR r0
  let x = n0 * 0.007 * max 0 (n1 * 0.6 + 0.4)
      geom n i z = take n (iterate (* z) i)
      iota n i z = take n (iterate (+ z) i)
      d = klankSpec (iota 12 f f) (geom 12 1 r1) r2
      k = klank x 1 0 1 d
  return (softClip (k * 0.1))

main :: IO ()
main = overlapTextureU (2,5,12,maxBound) =<< bowed_string
