-- fm-iter (rd)

import Sound.SC3.ID {- hsc3 -}

fm_iter :: UGen
fm_iter =
  let t0 = impulse AR (recip 0.30) 0
      t1 = tDelay t0 0.15
      t = mce2 t0 t1
      k = tRand 'a' 56 57 t
      i = tRand 'a' 40 480 t
      j = tRand 'a' (-1) 1 t
      c = midiCPS k
      m = midiCPS (k + 1 + j)
      s = envPerc 0.01 0.9
      e = envGen AR t 0.1 0 1 RemoveSynth s
      f = sinOsc AR c 0 * i + m
  in sinOsc AR f 0 * e

main :: IO ()
main = audition (out 0 fm_iter)