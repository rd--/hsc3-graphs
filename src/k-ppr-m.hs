-- k-ppr-m (rd)

import Control.Monad
import Sound.SC3.Monadic

k_ppr_m :: IO UGen
k_ppr_m = do
  let wrp i l r = linLin i (-1) 1 l r
      x = mouseX' KR 0.05 0.35 Linear 0.1
      y = mouseY' KR 0.15 0.75 Linear 0.1
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

{-
k_ppr_m >>= Sound.SC3.UGen.Dot.draw
-}

{-
{ var x = MouseX.kr(0.05, 0.35, 'linear', 0.1)
; var y = MouseY.kr(0.15, 0.75, 'linear', 0.1)
; var ti = LFTri.kr(x, 0)
; var tf = ti.range(100, 200)
; var t = Impulse.ar(tf, 0)
; var stream = { arg lf, rf, ld, rd, g
               ; { var r1 = Rand.new(9, 18)
                 ; var t_ = PulseDivider.ar(t, r1, 0)
                 ; var r2 = TRand.ar(lf, ti.range(lf, rf), t_)
                 ; var r3 = TRand.ar(ld, rd, t_)
                 ; Ringz.ar(Decay2.ar(t_, 0.01, 0.5), r2, r3 * y) * g } }
; var s1 = stream.value(3140, 6240, 0.050, 0.005, 0.15)
; var s2 = stream.value(0400, 9000, 0.005, 0.005, 0.15)
; Out.ar(0, Array.fill(2, s1) + Array.fill(2, s2)) }.play
-}
