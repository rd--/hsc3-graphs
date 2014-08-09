-- noise burst sweep (jmcc) #6

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

nbs :: ID a => a -> UGen
nbs e =
  let n = uclone e 2 (whiteNoise e AR)
      lfoRate = rand e (-1) 1 + mouseX KR 10 60 Exponential 0.2
      amp = max 0 (lfSaw KR lfoRate (-1))
      cfreq = mouseY KR 400 8000 Exponential 0.2
      freq = sinOsc KR 0.2 0 * cfreq + (1.05 * cfreq)
  in resonz (n * amp) freq 0.1

main :: IO ()
main = overlapTextureU (4,2,4,maxBound) (nbs 'α')

{-
audition (out 0 (nbs 'α'))
-}
