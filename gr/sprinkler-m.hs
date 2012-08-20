-- sprinkler-m (jmcc)

import Sound.SC3.Monad {- hsc3 -}

sprinkler_m :: UId m => m UGen
sprinkler_m = do
  n <- whiteNoise AR
  let f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  return (bpz2 (n * t))

main :: IO ()
main = audition . out 0 =<< sprinkler_m
