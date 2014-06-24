-- lz-bf (rd)

import Sound.OSC {- hosc -}
import Sound.SC3.ID {- hsc3 -}

lz_bf_u :: UGen
lz_bf_u =
  let x = mouseX KR 1 12 Linear 0.1
      l = lorenzL AR sampleRate
                     (mulAdd (lfNoise0 'α' KR x) 2 12)
                     (mulAdd (lfNoise0 'β' KR x) 20 38)
                     (mulAdd (lfNoise0 'γ' KR x) 1.5 3)
                     (mce2 0.025 0.05)
                     0.1 0.0 0.0
      p = phasor AR 0 (l * 24 * bufRateScale KR 0) 0 (bufFrames KR 0) 0
  in bufRd 1 AR 0 p NoLoop CubicInterpolation

lz_bf :: Transport m => String -> m ()
lz_bf fn = do
  _ <- async (b_allocRead 0 fn 0 0)
  play (out 0 lz_bf_u)

main :: IO ()
main = withSC3 (lz_bf "/home/rohan/data/audio/pf-c5.aif")
