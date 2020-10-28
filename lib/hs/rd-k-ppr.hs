-- k-ppr (rd, 2006-10-29)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3-rw -}
import Sound.SC3.Common.Monad.Operators {- hsc3 -}

k_ppr :: UGen
k_ppr =
  let x = mouseX KR 0.05 0.35 Linear 0.1
      y = mouseY KR 0.15 0.75 Linear 0.1
      ti = lfTri KR x 0
      tf = linLin_b ti 100 200
      t = impulse AR tf 0
      stream e lf rf ld rd g =
          let r1 = rand e 9 18
              t' = pulseDivider t r1 0
              r2 = tRand e lf (linLin_b ti lf rf) t'
              r3 = tRand e ld rd t'
          in ringz (decay2 t' 0.01 0.5) r2 (r3 * y) * g
      s1 = stream 'α' 3140 6240 0.050 0.005 0.15
      s2 = stream 'β' 0400 9000 0.005 0.005 0.15
  in uclone_all 'γ' 2 s1 + uclone_all 'δ' 2 s2

k_ppr_m :: UId m => m UGen
k_ppr_m = do
  let x = mouseX KR 0.05 0.35 Linear 0.1
      y = mouseY KR 0.15 0.75 Linear 0.1
      ti = lfTri KR x 0
      tf = linLin_b ti 100 200
      t = impulse AR tf 0
      stream lf rf ld rd g =
          do r1 <- randM 9 18
             let t' = pulseDivider t r1 0
             r2 <- tRandM lf (linLin_b ti lf rf) t'
             r3 <- tRandM ld rd t'
             return (ringz (decay2 t' 0.01 0.5) r2 (r3 * y) * g)
      s1 = stream 3140 6240 0.050 0.005 0.15
      s2 = stream 0400 9000 0.005 0.005 0.15
  clone 2 s1 .+. clone 2 s2

k_ppr' :: UGen
k_ppr' = uid_st_eval k_ppr_m

main :: IO ()
main = audition (out 0 k_ppr)
