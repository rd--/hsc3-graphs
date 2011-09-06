-- discretion (rd)

import Sound.SC3.ID

discretion :: UGen
discretion =
  let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      part = let f1 = udup 2 (rand 'a' 50 55)
                 f2 = udup 2 (rand 'c' 50 65)
                 f3 = udup 2 (rand 'e' 50 55)
                 a = udup 2 (rand 'g' 0.01 0.035)
                 t = 21
                 f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
                 a_ = mkls [(0,0),(0.33,a),(1,0)] t
             in (saw AR f_ * a_)
  in mix (uclone 'a' 8 part)

main :: IO ()
main = audition (out 0 discretion)

{-
Sound.SC3.UGen.Dot.draw discretion
-}
