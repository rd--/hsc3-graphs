-- birds (jmcc)
-- http://lists.create.ucsb.edu/pipermail/sc-users/2007-April/033239.html

import Sound.SC3 {- hsc3 -}

birds :: UId m => m UGen
birds = do
  let node = do r1 <- randM 94.0 102.0
                r2 <- randM (-1.5) 1.5
                r3 <- randM 0.0 1.0
                r4 <- randM 11.0 15.0
                r5 <- randM 0.0 1.0
                r6 <- randM 12.0 15.6
                r7 <- randM 0.0 1.0
                r8 <- randM (-1.0) 1.0
                let f = r1 + lag (lfSaw AR (7 + r2) r3 * r4) 0.1
                    a = lfPulse KR (1.0 / r6) r7 0.16 * 0.05
                    b = sinOsc AR (midiCPS f) r5 * a
                return (rotate2 b (silent 1) r8)
      apf i = do r1 <- randM 0.0 0.06
                 r2 <- randM 0.7 2.0
                 return (allpassL i 0.07 r1 r2)
  d <- return . sum =<< sequence (replicate 6 node)
  w <- chainM 12 apf d
  return (d * 0.7 + w * 0.3)

-- > birds >>= putStrLn . synthstat
main :: IO ()
main = audition . out 0 =<< birds
