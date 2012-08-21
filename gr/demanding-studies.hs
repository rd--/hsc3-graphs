-- demanding studies (jmcc)

import Sound.SC3.ID {- hsc3 -}

demanding_studies :: UGen
demanding_studies =
  let s1 = drand 'a' dinf (mce [72, 75, 79, 82])
      s2 = drand 'b' 1 (mce [82, 84, 86])
      s3 = dseq 'c' dinf (mce [72, 75, 79, s2])
      x = mouseX KR 5 13 Linear 0.2
      tr = impulse KR x 0
      f = demand tr 0 (mce [midiCPS (s1 - 12), midiCPS s3])
      o1 = sinOsc AR (f + mce2 0 0.7) 0
      o2 = saw AR (f + mce2 0 0.7) * 0.3
      o3 = cubed (distort (log (distort (o1 + o2))))
  in o3 * 0.1

main :: IO ()
main = audition (out 0 demanding_studies)
