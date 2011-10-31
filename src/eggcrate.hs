-- eggcrate (rd)

import Sound.SC3.ID

atp :: (t -> u) -> (t,t) -> (u,u)
atp f (i,j) = (f i,f j)

eggcrate :: UGen
eggcrate =
  let cosu = cos . (* pi)
      sinu = sin . (* pi)
      eggcrate_f u v = cosu u * sinu v
      p = mce [64,72,96,128,256,6400,7200,8400,9600]
      (x,y) = atp (`brownNoise` KR) ('a','b')
      t = dust 'c' KR 2.4
      (f0,f1) = atp (\z -> tChoose z t p) ('a','b')
      f = linLin (eggcrate_f x y) (-1) 1 f0 f1
      a = linLin x (-1) 1 0 0.1
 in pan2 (mix (sinOsc AR f 0)) y a

main :: IO ()
main = audition (out 0 eggcrate)
