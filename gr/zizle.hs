-- zizle (jmcc) #SC3d1.5

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

twopi :: Floating n => n
twopi = 2 * pi

rand2 :: ID a => a -> UGen -> UGen
rand2 e n = rand e (-n) n

-- > Sound.SC3.UGen.Dot.draw zizle
-- > audition zizle
zizle :: UGen
zizle =
  let a e f = let fm = mce2 (rand 'α' 0.7 1.3) 1
                  ph = mce2 (rand 'β' 0 twopi) (rand 'γ' 0 twopi)
              in uprotect e (mix (sinOsc AR (f * fm) ph * 0.1))
      a1 = max (a 'δ' (expRand 'ε' 0.3 8)) 0
      a2 = abs (a 'ζ' (expRand 'η' 6 24))
      o = sinOsc AR (midiCPS (rand 'θ' 24 108)) (rand 'ι' 0 twopi)
  in pan2 (o * a1 * a2) (rand2 'κ' 1) 1

main :: IO ()
main = overlapTextureU (4,4,12,maxBound) zizle
