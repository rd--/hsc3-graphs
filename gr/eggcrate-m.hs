-- eggcrate-m (rd)

import Sound.SC3.Monad {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw =<< eggcrate
eggcrate :: UId m => m UGen
eggcrate = do
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
  [x,y] <- sequence (replicate 2 (brownNoise KR))
  t <- dust KR 2.4
  [f0,f1] <- sequence (replicate 2 (tChoose t p))
  let f = linLin (eggcrate_f x y) (-1) 1 f0 f1
      a = linLin x (-1) 1 0 0.1
  return (pan2 (mix (sinOsc AR f 0)) y a)

main :: IO ()
main = audition . out 0 =<< eggcrate
