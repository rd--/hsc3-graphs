-- eggcrate-m (rd)

import Sound.SC3 {- hsc3 -}

eggcrate :: UId m => m UGen
eggcrate = do
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
  [x,y] <- sequence (replicate 2 (brownNoiseM KR))
  t <- dustM KR 2.4
  [f0,f1] <- sequence (replicate 2 (tChooseM t p))
  let f = linLin_b (eggcrate_f x y) f0 f1
      a = linLin_b x 0 0.1
  return (pan2 (mix (sinOsc AR f 0)) y a)

main :: IO ()
main = audition . out 0 =<< eggcrate
