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

{-
{var n = WhiteNoise.ar ! 2
;var lfoRate = MouseX.kr(10,60,'exponential',0.2)
;var amp = max(0,LFSaw.kr(lfoRate,-1))
;var cfreq = MouseY.kr(400,8000,'exponential',0.2)
;var freq = SinOsc.kr(0.2,0) * cfreq + (1.05 * cfreq)
;Out.ar(0,Resonz.ar(n * amp,freq,0.1))}.play
-}
