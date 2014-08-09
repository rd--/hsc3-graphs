-- eggcrate (rd)

import Sound.SC3 {- hsc3 -}

atp :: (t -> u) -> (t,t) -> (u,u)
atp f (i,j) = (f i,f j)

eggcrate :: UGen
eggcrate =
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
      (x,y) = atp (`brownNoise` KR) ('α','β')
      t = dust 'γ' KR 2.4
      (f0,f1) = atp (\z -> tChoose z t p) ('δ','ε')
      f = linLin_b (eggcrate_f x y) f0 f1
      a = linLin_b x 0 0.1
 in pan2 (mix (sinOsc AR f 0)) y a

main :: IO ()
main = audition (out 0 eggcrate)
