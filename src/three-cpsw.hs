-- three-cpsw (rd)

import Sound.SC3.Monadic

three_cpsw :: UId m => m UGen
three_cpsw = do
  t <- dust KR (mce2 12 18)
  f0 <- tRand 1 64 t
  f1 <- lfNoise0 KR f0
  a <- tRand 0.0 0.5 t
  dt <- tRand 0.975 1.025 t
  dh <- tRand 0.750 0.7505 t
  let f = f1 * mce2 9000 12000 + 9500
      o = saw AR f + saw AR (f * dh) + saw AR (f * dt)
  return (clip2 (o * a) 0.75)

main :: IO ()
main = audition . out 0 =<< three_cpsw
