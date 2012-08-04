-- plucked strings (jmcc)

import Sound.SC3.Monad

plucked_strings :: UId m => m UGen
plucked_strings = do
  let dt = do r0 <- rand 60 90
              return (1 / midiCPS (floorE r0))
      i = do r0 <- rand 2 2.2
             n0 <- dust AR 0.5
             r1 <- rand 0.05 0.15
             r2 <- rand 0 (pi * 2)
             r3 <- iRand 0 2
             let s0 = impulse AR r0 0.3
                 s1 = n0 * 0.3
                 s2 = impulse AR (sinOsc KR r1 r2 * 5 + 5.2) 0.3
             return (select r3 (mce [s0,s1,s2]))
      s = do n0 <- pinkNoise AR
             r1 <- rand (-1) 1
             im <- i
             dt' <- dt
             let t = decay im 0.1 * n0 * 0.1
             return (pan2 (combL t dt' dt' 4) r1 1)
  return.sum =<< sequence (replicate 5 s)

main :: IO ()
main = audition . out 0 =<< plucked_strings
