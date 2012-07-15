-- k-ppr (rd)

import Sound.SC3.ID
import Sound.SC3.UGen.Protect

k_ppr :: UGen
k_ppr =
  let wrp i = linLin i (-1) 1
      x = mouseX KR 0.05 0.35 Linear 0.1
      y = mouseY KR 0.15 0.75 Linear 0.1
      ti = lfTri KR x 0
      tf = wrp ti 100 200
      t = impulse AR tf 0
      stream e lf rf ld rd g =
          let r1 = rand e 9 18
              t' = pulseDivider t r1 0
              r2 = tRand e lf (wrp ti lf rf) t'
              r3 = tRand e ld rd t'
          in ringz (decay2 t' 0.01 0.5) r2 (r3 * y) * g
      s1 = stream 'a' 3140 6240 0.050 0.005 0.15
      s2 = stream 'a' 0400 9000 0.005 0.005 0.15
  in uclone 'a' 2 s1 + uclone 'b' 2 s2

main :: IO ()
main = audition (out 0 k_ppr)

{-
Sound.SC3.UGen.Dot.draw k_ppr
-}
