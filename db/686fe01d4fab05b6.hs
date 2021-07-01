-- discretion (rd, 2006-10-15) ; monad
uid_st_eval (do
  let clone n = fmap mce . replicateM n
      mkls bp t = envGen kr 1 1 0 1 RemoveSynth (envCoord bp t 1 EnvLin)
      part = do f1 <- clone 2 (randM 50 55)
                f2 <- clone 2 (randM 50 65)
                f3 <- clone 2 (randM 50 55)
                a <- clone 2 (randM 0.01 0.035)
                let t = 21
                    f_ = mkls [(0,f1),(0.33,f2),(1,f3)] t
                    a_ = mkls [(0,0),(0.33,a),(1,0)] t
                return (saw ar f_ * a_)
  fmap mix (clone 8 part))
