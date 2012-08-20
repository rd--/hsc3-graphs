-- discretion-m (rd)

import Sound.SC3.Monad {- hsc3 -}

-- > Sound.SC3.UGen.Dot.draw =<< discretion
discretion :: UId m => m UGen
discretion = do
  let mkls bp t = envGen KR 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      part = do f1 <- clone 2 (rand 50 55)
                f2 <- clone 2 (rand 50 65)
                f3 <- clone 2 (rand 50 55)
                a <- clone 2 (rand 0.01 0.035)
                let t = 21
                    f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
                    a_ = mkls [(0,0),(0.33,a),(1,0)] t
                return (saw AR f_ * a_)
  fmap mix (clone 8 part)

main :: IO ()
main = audition . out 0 =<< discretion
