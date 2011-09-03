-- snare-909 (jmcc)

import Sound.SC3.ID

snare_909 :: UGen -> UGen
snare_909 tr =
  let n = whiteNoise 'a' AR
      v = tRand 'a' 0.25 1.0 tr
      e a b = envGen AR tr 1 0 1 DoNothing (envPerc a b)
      e1 = e 0.0005 0.055
      e2 = e 0.0005 0.075
      e3 = e 0.0005 0.4
      e4 = e 0.0005 0.283
      t1 = lfTri AR 330 0
      t2 = lfTri AR 185 0
      x1 = lpf n 7040 * 0.1 + v
      x2 = hpf x1 523
      m1 = t1 * e1 * 0.25 + t2 * e2 * 0.25
      m2 = x1 * e3 * 0.20 + x2 * e4 * 0.20
  in m1 + m2

snare_909_a :: UGen
snare_909_a =
    let x = mouseX' KR 1 4 Linear 0.2
        y = mouseY' KR 0.25 0.75 Exponential 0.2
        t = impulse KR (3 * x) 0
    in pan2 (snare_909 t) 0 y

main :: IO ()
main = audition (out 0 snare_909_a)

