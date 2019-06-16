-- chrd (rd)

import Sound.SC3 {- hsc3 -}

chrd_m :: UId m => m UGen
chrd_m = do
  r0 <- randM 0.05 0.5
  r1 <- randM (-1) 1
  r2 <- randM (-1) 1
  r3 <- randM 0.15 0.35
  r4 <- randM 0.005 0.01
  let m = mce [60, 65, 72, 77, 79, 84]
      ds = 3
      d = mce (map (* ds) [5, 4, 5, 7, 4, 5])
      f = midiCPS (xLine KR m (m + r0) d DoNothing)
      z = envTrapezoid 0 r3 d r4
      e = envGen KR 1 1 0 1 DoNothing z
      p = xLine KR r1 r2 d DoNothing
      o = fSinOsc AR f 0
  return (mix (pan2 o p e))

chrd9_m :: UId m => m UGen
chrd9_m = fmap mix (clone 9 chrd_m)

chrd9 :: UGen
chrd9 = uid_st_eval chrd9_m

main :: IO ()
main = audition (out 0 chrd9)