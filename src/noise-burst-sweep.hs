-- noise burst sweep (jmcc)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.OverlapTexture

nbs :: UGen
nbs =
  let n = udup 2 (whiteNoise 'a' AR)
      lfoRate = mouseX' KR 10 60 Exponential 0.2
      amp = max 0 (lfSaw KR lfoRate (-1))
      cfreq = mouseY' KR 400 8000 Exponential 0.2
      freq = sinOsc KR 0.2 0 * cfreq + (1.05 * cfreq)
  in resonz (n * amp) freq 0.1

main :: IO ()
main = overlapTextureU (2,4,4,maxBound) nbs

{-
audition (out 0 nbs)
-}
