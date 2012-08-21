-- lf pulses (rd)

import Sound.SC3.ID {- hsc3 -}

lf_pulses :: UGen
lf_pulses =
  let n0 = lfNoise0 'a' AR (mce2 20 40)
      n1 = lfNoise0 'a' AR (mce2 5 10)
      x = mouseX KR 0.012 0.19 Exponential 0.1
      f = formlet (blip AR 10 12) (n0 * 43 + 700) 0.005 x
      o = sinOsc AR 40 0 * n1
  in clip2 (leakDC (f + o) 0.995) 0.75

main :: IO ()
main = audition (out 0 lf_pulses)

