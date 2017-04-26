-- fwalk (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

fwalk_f :: UId m => UGen -> m UGen
fwalk_f r = do
  t <- dustM KR 3
  r1 <- tIRandM 0 6 t
  r2 <- tRandM (-0.0001) 0.0001 t
  let f = bufRdL 1 KR (mce2 0 1) r1 NoLoop
      f' = f + r2
      o1 = blip AR (midiCPS (r + f)) 12
      o2 = blip AR (midiCPS (r + f')) 12
  return ((o1 + o2) * decay2 t 0.3 1.2 * 0.1)

fwalk_m :: UId m => m UGen
fwalk_m = do
  f1 <- fwalk_f 24
  f2 <- fwalk_f 36
  return (f1 + f2)

fwalk :: UGen
fwalk = uid_st_eval fwalk_m

run :: (UId m,Transport m) => m ()
run = do
  let n = [40,47,42,40,50
          ,43,35,43,40,47
          ,45,35,43,42,59
          ,48,40,47,52,45]
      m = [40,40,42,47,50
          ,35,43,43,40,45
          ,42,35,48,47,43
          ,40,59,45,47,52]
  _ <- async (b_alloc_setn1 0 0 n)
  _ <- async (b_alloc_setn1 1 0 m)
  play (out 0 fwalk)

main :: IO ()
main = withSC3 run
