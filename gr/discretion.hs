-- discretion (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.UGen.Protect
import Sound.SC3.UGen.External.RDU {- sc3-rdu -}

-- > Sound.SC3.UGen.Dot.draw discretion
discretion :: UGen
discretion =
  let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      part = let f1 = randN 2 'a' 50 55
                 f2 = randN 2 'c' 50 65
                 f3 = randN 2 'e' 50 55
                 a = randN 2 'g' 0.01 0.035
                 t = 21
                 f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
                 a_ = mkls [(0,0),(0.33,a),(1,0)] t
             in (saw AR f_ * a_)
  in mix (uclone 'a' 8 part)

main :: IO ()
main = audition (out 0 discretion)
