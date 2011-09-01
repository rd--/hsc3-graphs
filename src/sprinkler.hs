-- sprinkler (jmcc)

import Sound.SC3.ID

sprinkler :: UGen
sprinkler =
  let n = whiteNoise 'α' AR
      f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  in bpz2 (n * t)

main :: IO ()
main = audition (out 0 sprinkler)
