-- harmonic swimming (jmcc)

import Sound.SC3.Monad {- hsc3 -}

main :: IO ()
main =
  let a = 0.02
      f = 50
      p = 20
      l = line KR 0 (- a) 60 DoNothing
      o h = do r <- clone 2 (rand 2 8)
               n <- lfNoise1 KR r
               let e = max 0 (n * a + l)
               return (fSinOsc AR (f * (h + 1)) 0 * e)
  in audition . out 0 . sum =<< mapM o [0..p]
