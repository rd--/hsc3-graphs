-- trkl (rd)

import Sound.SC3 {- hsc3 -}

import qualified Sound.SC3.Lang.Control.OverlapTexture as O {- hsc3-lang -}

trkl_f :: UId m => UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> m UGen
trkl_f d ul fu dy la fy = do
  let tf = xLine KR 1 ul d RemoveSynth
      st = impulse AR (tf * 8) 0
      t = impulse AR tf 0
  r0 <- rand2M 1
  r1 <- rand2M 1
  r2 <- tRandM 0.05 1.0 t
  r3 <- tExpRandM 0.001 0.25 st -- non-zero minima
  fh <- tRandM 1.75 2.25 t
  let a = dbAmp (line KR 12 la d RemoveSynth)
      f = xLine KR fu 900 d RemoveSynth
      p = line KR r0 r1 d RemoveSynth
      o1 = mix (ringz (decay2 t 0.01 dy) (mce2 f (f * fh)) fy)
      o2 = mix (saw AR (mce2 f (f * fh)))
  return (pan2 (o1 + o2 * decay2 t 0.1 r2 * r3) p a)

-- > audition . out 0 =<< trkl_r
trkl_m :: UId m => m UGen
trkl_m = do
  d <- randM 0.5 16
  ul <- randM 16 64
  fu <- randM 1200 9000
  dy <- randM 0.005 0.175
  la <- randM (-60) (-25)
  fy <- randM 0.015 0.125
  trkl_f d ul fu dy la fy

trkl :: UGen
trkl = uid_st_eval trkl_m

main :: IO ()
main = O.overlapTextureU (5,2,12,maxBound) trkl
