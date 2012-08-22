-- trkl (rd)

import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}
import Sound.SC3.Monad {- hsc3 -}

trkl :: UId m => UGen -> UGen -> UGen -> UGen -> UGen -> UGen -> m UGen
trkl d ul fu dy la fy = do
  let tf = xLine KR 1 ul d RemoveSynth
      st = impulse AR (tf * 8) 0
      t = impulse AR tf 0
  r0 <- rand (-1) 1
  r1 <- rand (-1) 1
  r2 <- tRand 0.05 1.0 t
  r3 <- tExpRand 0.001 0.25 st -- non-zero minima
  fh <- tRand 1.75 2.25 t
  let a = dbAmp (line KR 12 la d RemoveSynth)
      f = xLine KR fu 900 d RemoveSynth
      p = line KR r0 r1 d RemoveSynth
      o1 = mix (ringz (decay2 t 0.01 dy) (mce2 f (f * fh)) fy)
      o2 = mix (saw AR (mce2 f (f * fh)))
  return (pan2 (o1 + o2 * decay2 t 0.1 r2 * r3) p a)

-- > Sound.SC3.UGen.Dot.draw =<< trkl_r
-- > audition . out 0 =<< trkl_r
trkl_r :: UId m => m UGen
trkl_r = do
  d <- rand 0.5 16
  ul <- rand 16 64
  fu <- rand 1200 9000
  dy <- rand 0.005 0.175
  la <- rand (-60) (-25)
  fy <- rand 0.015 0.125
  trkl d ul fu dy la fy

main :: IO ()
main = overlapTextureU (5,2,12,maxBound) =<< trkl_r
