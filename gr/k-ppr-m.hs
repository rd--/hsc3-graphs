-- k-ppr-m (rd)

import Control.Monad {- base -}
import Sound.SC3.Monad {- hsc3 -}

k_ppr_m :: UId m => m UGen
k_ppr_m = do
  let wrp i = linLin i (-1) 1
      x = mouseX KR 0.05 0.35 Linear 0.1
      y = mouseY KR 0.15 0.75 Linear 0.1
      ti = lfTri KR x 0
      tf = wrp ti 100 200
      t = impulse AR tf 0
      stream lf rf ld rd g =
          do r1 <- rand 9 18
             let t' = pulseDivider t r1 0
             r2 <- tRand lf (wrp ti lf rf) t'
             r3 <- tRand ld rd t'
             return (ringz (decay2 t' 0.01 0.5) r2 (r3 * y) * g)
      s1 = stream 3140 6240 0.050 0.005 0.15
      s2 = stream 0400 9000 0.005 0.005 0.15
  liftM2 (+) (clone 2 s1) (clone 2 s2)

main :: IO ()
main = audition . out 0 =<< k_ppr_m
