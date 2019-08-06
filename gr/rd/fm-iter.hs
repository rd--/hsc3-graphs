-- fm-iter (rd, 2006-09-22)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.OverlapTexture {- hsc3-lang -}

-- audition (out 0 fm_iter)
fm_iter :: UGen
fm_iter =
  let f0 = recip (0.3 + whiteNoise 'α' AR * 0.01)
      t0 = impulse AR f0 0
      t1 = tDelay t0 0.15
      t = mce2 t0 t1
      k = tRand 'β' 56 57 t
      i = tRand 'γ' 40 480 t
      j = tRand 'δ' (-1) 1 t
      c = midiCPS k
      m = midiCPS (k + 1 + j)
      s = envPerc 0.01 0.9
      e = envGen AR t 0.1 0 1 RemoveSynth s
      f = sinOsc AR c 0 * i + m
  in sinOsc AR f 0 * e

main :: IO ()
main = overlapTextureU (3,3,6,maxBound) fm_iter
