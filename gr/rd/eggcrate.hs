-- eggcrate (rd, 2007-04-23)

import Sound.SC3 {- hsc3 -}

bimap :: (t -> u) -> (t,t) -> (u,u)
bimap f (i,j) = (f i,f j)

eggcrate :: UGen
eggcrate =
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
      (x,y) = bimap (`brownNoise` KR) ('α','β')
      t = dust 'γ' KR 2.4
      (f0,f1) = bimap (\z -> tChoose z t p) ('δ','ε')
      f = linLin_b (eggcrate_f x y) f0 f1
      a = linLin_b x 0 0.1
 in pan2 (mix (sinOsc AR f 0)) y a

eggcrate_m :: UId m => m UGen
eggcrate_m = do
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

eggcrate' :: UGen
eggcrate' = uid_st_eval eggcrate_m

main :: IO ()
main = audition (out 0 eggcrate)
