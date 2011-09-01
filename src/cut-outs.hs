-- cut-outs (rd)

import Sound.SC3.Monadic

cut_outs :: (Functor m,UId m) => m UGen
cut_outs = do
  let t = impulse AR 22 0 * (sinOsc KR 0.5 0 + 1)
      x = mouseX' KR 0.005 0.12 Exponential 0.1
      y = mouseY' KR 0.01 0.52 Exponential 0.1
      n = do n1 <- lfNoise0 KR 2
             n2 <- coinGate (0.05 + n1 + y * 0.4 + t * 0.5) (t * 0.5)
             n3 <- tExpRand (mce2 500 900) 1600 t
             return (ringz n2 n3 x)
  s <- fmap sum (sequence (replicate 3 n))
  b <- tRand 0 1 =<< dust KR 8
  return (mrg [clip2 s (in' 1 KR 0) * 0.25,out 0 b])

main :: IO ()
main = audition . out 0 =<< cut_outs
