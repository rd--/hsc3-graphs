-- sprinkler (jmcc) #1

import Sound.SC3.ID {- hsc3 -}

sprinkler :: UGen
sprinkler =
  let n = whiteNoise 'α' AR
      f = lfPulse KR 0.09 0 0.16 * 10 + 7
      t = lfPulse KR f 0 0.25 * 0.1
  in bpz2 (n * t)

main :: IO ()
main = audition (out 0 sprinkler)

-- > audition (out 0 sprinkler')
sprinkler' :: UGen
sprinkler' =
  let n = whiteNoise 'α' AR
      f = mouseX KR 0.2 50 Linear 0.2
      t = lfPulse KR f 0 0.25 * 0.1
  in bpz2 (n * t)
