-- klink (rd, 2006-10-23)

import Sound.SC3 {- hsc3 -}

klink :: UGen
klink =
  let n1 = lfNoise0 'α' KR (mce2 0.5 1.5)
      o = sinOsc KR n1 0
      a = abs (slope o) * mce2 2 3
      t = impulse AR a 0
      i = decay2 t 0.01 0.1
      x = mouseX KR 960 3620 Exponential 0.2
      y = mouseY KR 0.5 2.0 Linear 0.2
      n2 = tRand 'β' x 3940 t
      n3 = tRand 'γ' 0.005 0.275 t
  in ringz i n2 (n3 * y)

main :: IO ()
main = audition (out 0 klink)
