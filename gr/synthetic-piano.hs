-- synthetic piano (jmcc) #3

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

synthetic_piano :: UGen
synthetic_piano =
  let n = iRand 'α' 36 90
      f = rand 'β' 0.1 0.5
      ph = rand 'γ' 0 1
      s = impulse AR f ph * 0.1
      e = decay2 s 0.008 0.04
      c z o = let n0 = lfNoise2 z AR 3000
                  dt = 1 / midiCPS (n + o)
              in combL (n0 * e) dt dt 6
      l = ((n - 36) / 27) - 1
      c_ = sum_opt (zipWith c ['δ'..] [-0.05,0,0.04])
  in pan2 c_ l 1

main :: IO ()
main = overlapTextureU (6,0,6,maxBound) synthetic_piano
