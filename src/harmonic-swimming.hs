-- harmonic swimming (jmcc)

import Sound.SC3.ID

harmonic_swimming :: UGen
harmonic_swimming =
  let a = 0.02
      f = 50
      p = 20
      l = line KR 0 (- a) 60 DoNothing
      o h = let r = udup 2 (rand 'a' 2 8)
                n = lfNoise1 'a' KR r
                e = max 0 (n * a + l)
            in fSinOsc AR (f * (h + 1)) 0 * e
  in sum (uprotect 'a' (map o [0..p]))

main :: IO ()
main = audition (out 0 harmonic_swimming)
