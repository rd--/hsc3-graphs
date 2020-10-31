-- shifting pulses (rd, 2006-09-18)

import Sound.SC3 {- hsc3 -}

prt :: UId m => UGen -> UGen -> m UGen
prt a f = do
  r0 <- randM 0.2 0.9
  r1 <- randM 0.95 1.05
  r2 <- clone 2 (randM 0.95 1.05)
  let f' = f * linLin_b (sinOsc KR r0 0) 1 1.01 * r1
      a' = a * r2
      o = sinOsc AR (mce2 f f') 0
  return (o * a')

-- audition . out 0 =<< prts 2 900 0.002
-- audition . out 0 =<< prts 9 40 0.006
prts :: UId m => UGen -> UGen -> UGen -> m UGen
prts n f a = fmap sum (mapM (prt a) [f,f + f .. f * n])

-- audition . out 0 =<< fmt
fmt :: UId m => m UGen
fmt = do
  n <- (lfNoise2M KR 2)
  return (formant AR (mce2 20 21) (linLin_b n 10 100) 200 * 0.35)

-- audition . out 0 =<< pulses
pulses :: UId m => m UGen
pulses = do
  n0 <- clone 2 (brownNoiseM KR)
  n1 <- clone 2 (brownNoiseM KR)
  n2 <- clone 2 (brownNoiseM KR)
  t <- dustM KR 0.75
  let warp i = linLin i (-1) 1
      l = latch t t
      p = pulse AR (warp n0 2 (mce2 11 15)) 0.01 * 0.1
      f = warp n1 90 300
      rq = warp n2 2 9
  return (mrg2 (l * rlpf p f rq) (sendTrig t 0 t))

shifting_pulses_m :: UId m => m UGen
shifting_pulses_m = do
  p1 <- prts 2 900 0.008
  p2 <- prts 9 40 0.022
  f <- fmt
  s <- pulses
  return (p1 + p2 + f + s)

shifting_pulses :: UGen
shifting_pulses = uid_st_eval shifting_pulses_m

main :: IO ()
main = audition (out 0 shifting_pulses)