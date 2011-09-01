-- f-lets (rd)

import Sound.SC3.Monadic

f_lets :: (Functor m,UId m) => m UGen
f_lets = do
  let f_let t g j n f = do
           let pd = pulseDivider t j 0
           r0 <- tIRand (mce2 2 1) n pd
           r1 <- tRand 0.01 0.04 pd
           r2 <- tRand 0.05 0.10 pd
           return (formlet pd (f * r0) r1 r2 * g)
      mk_n t = do
           r0 <- tRand 0 1 t
           r1 <- tRand 0 1 t
           r2 <- tRand 0 1 t
           r3 <- tRand 0 1 t
           r4 <- coinGate 0.2 t
           sequence [f_let t 0.15 2 9 (mce2 200 400)
                    ,f_let t 0.25 2 9 (mce2 (200 + r0) (400 + r1))
                    ,f_let t 0.05 4 5 (mce2 25 50)
                    ,f_let t 0.15 4 5 (mce2 (25 + r2) (50 + r3))
                    ,let lr = fmap (* (latch r4 t))
                     in lr (f_let t 0.5 1 16 (mce2 300 600))]
      tr = impulse AR 24 0
  n <- lfNoise0 KR 2
  return . (* (n * 0.25 + 0.25)) . sum =<< mk_n tr

main :: IO ()
main = audition . out 0 =<< f_lets
