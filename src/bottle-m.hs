-- bottle (sc)

import Sound.SC3.Lang.Control.OverlapTexture
import Sound.SC3.Monad

bottle :: UId m => m UGen
bottle = do
  freq <- rand 220 880
  wn <- whiteNoise AR
  pn <- pinkNoise AR
  let (>=>) f g x = f x >>= g
      chain n f = foldl (>=>) return (replicate n f)
      perc = envPerc 0.1 0.6
      ex = envGen KR 1 1 0 1 DoNothing perc * wn * 0.02
      flute = ringz ex freq 0.3
      r = resonz pn (5 + (freq / 2)) 0.1
      breath = envGen KR 1 1 0 1 DoNothing perc * r
      rapf i = do x <- linRand 0.001 0.1 (-1)
                  return (i + allpassN i 0.1 x 1.0 * 0.5)
      cls i = let en = let c = EnvNum (-4) in (c,c,c)
                  l = envLinen' 0.01 3.0 1.0 1 en
                  z = (breath + i) * envGen KR 1 1 0 1 RemoveSynth l
              in mce2 z z
  f <- chain 2 rapf flute
  return (cls f)

main :: IO ()
main = overlapTextureU (2,0,2,maxBound) =<< bottle
