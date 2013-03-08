-- red_frik (f0)

import Sound.SC3.Monad {- hsc3 -}

red :: UId m => UGen -> UGen -> m UGen
red tr n = do
  r1 <- tRand 0.3 3 tr
  r2 <- tRand 0.3 5 tr
  r3 <- tRand 0 0.5 tr
  r4 <- tRand 0.49 0.56 tr
  r5 <- tRand 0.3 0.6 tr
  r6 <- tRand 0.3 0.5 tr
  let o1 = fSinOsc KR r2 0 * r3 + r4
      o2 = fSinOsc KR o1 r5 * r6
  return (rhpf n r1 o2)

red_frik :: UId m => m UGen
red_frik = do
  n <- clone 2 (brownNoise AR)
  let tr = impulse KR 0.1 0
  red tr n

main :: IO ()
main = audition . out 0 =<< red_frik
