import Sound.SC3.Common {- hsc3 -}
import Sound.SC3.UGen.M {- hsc3-m -}

demanding_studies :: UGen
demanding_studies =
  let s1 = drand dinf (mce [72, 75, 79, 82])
      s2 = drand 1 (mce [82, 84, 86])
      s3 = dseq dinf (mce [72, 75, 79, s2])
      x = mouseX KR 5 13 Linear 0.2
      tr = impulse KR x 0
      f = demand tr 0 (mce2 (midiCPS (s1 - 12)) (midiCPS s3))
      o1 = sinOsc AR (f + mce2 0 0.7) 0
      o2 = saw AR (f + mce2 0 0.7) * 0.3
      o3 = cubed (distort (log (distort (o1 + o2))))
  in o3 * 0.1

main :: IO ()
main = audition_st demanding_studies
