-- police state (jmcc) #2

import Sound.SC3.Monad {- hsc3 -}

police_state :: UId m => m UGen
police_state = do
  let nd = do r0 <- rand 0.02 0.12
              r1 <- rand 0 (pi * 2)
              r2 <- rand 0 600
              r3 <- rand 700 1300
              r4 <- rand (-1) 1
              r5 <- rand 80 120
              n0 <- lfNoise2 AR r5
              let f = sinOsc KR r0 r1 * r2 + r3
              return (pan2 (sinOsc AR f 0 * n0 * 0.1) r4 1)
  ns <- clone 4 nd
  n0 <- clone 2 (lfNoise2 KR 0.4)
  n1 <- lfNoise2 AR (n0 * 90 + 620)
  n2 <- lfNoise2 KR (mce2 0.3 0.301)
  let e = n1 * (n2 * 0.15 + 0.18)
  return (combL (mix ns + e) 0.3 0.3 3)

main :: IO ()
main = audition . out 0 =<< police_state
