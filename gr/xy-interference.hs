-- xy-interference (rd)

import Sound.SC3 {- hsc3 -}

xy_interference :: UGen
xy_interference =
  let x = mouseX KR 20 22000 Linear (mce2 0.005 0.025)
      y = mouseY KR 20 22000 Linear (mce2 0.005 0.075)
      nd = let n = lfNoise0 'α' KR (mce2 5 9)
               a = sinOsc AR (x + n) 0
               b = sinOsc AR y 0
           in a * b
  in mix (uclone 'β' 3 nd) * 0.1

main :: IO ()
main = audition (out 0 xy_interference)
