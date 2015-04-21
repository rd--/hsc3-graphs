-- synthetic piano (jmcc) #3

import Sound.SC3.UGen.Record.CRU {- hsc3-rec -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

synthetic_piano :: UGen
synthetic_piano =
  let n = IRand 'α' 36 90
      f = Rand 'β' 0.1 0.5
      ph = Rand 'γ' 0 1
      s = Impulse AR f ph * 0.1
      e = Decay2 s 0.008 0.04
      c z o = let n0 = LFNoise2 z AR 3000
                  dt = 1 / midiCPS (n + o)
              in CombL (n0 * e) dt dt 6
      l = ((n - 36) / 27) - 1
      c_ = sum (zipWith c ['δ'..] [-0.05,0,0.04])
  in Pan2 c_ l 1

main :: IO ()
main = overlapTextureU (6,0,6,maxBound) (ugen synthetic_piano)
