-- chrd (rd)

import Sound.SC3.Monadic

chrd :: IO UGen
chrd = do
  r0 <- rand 0.05 0.5
  [r1, r2] <- sequence (replicate 2 (rand (-1) 1))
  r3 <- rand 0.15 0.35
  r4 <- rand 0.005 0.01
  let m = mce [60, 65, 72, 77, 79, 84]
      ds = 3
      d = mce (map (* ds) [5, 4, 5, 7, 4, 5])
      f = midiCPS (xLine KR m (m + r0) d DoNothing)
      z = envTrapezoid 0 r3 d r4
      e = envGen KR 1 1 0 1 DoNothing z
      p = xLine KR r1 r2 d DoNothing
      o = fSinOsc AR f 0
  return (mix (pan2 o p e))

chrd9 :: IO UGen
chrd9 = return . mix =<< clone 9 chrd

main :: IO ()
main = audition . out 0 =<< chrd9
