-- xy-interference (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect

xy_interference :: UGen
xy_interference =
  let x = mouseX KR 20 22000 Linear (mce2 0.005 0.025)
      y = mouseY KR 20 22000 Linear (mce2 0.005 0.075)
      nd = let n = lfNoise0 'a' KR (mce2 5 9)
               a = sinOsc AR (x + n) 0
               b = sinOsc AR y 0
           in a * b
  in mix (uclone 'a' 3 nd)

main :: IO ()
main = audition (out 0 xy_interference)
