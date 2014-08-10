-- tgr-rpr (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}

dustR' :: UId m => Rate -> UGen -> UGen -> m UGen
dustR' r lo hi = do
  n1 <- dwhiteM 1 lo hi
  n2 <- whiteNoiseM r
  d <- dseqM dinf n1
  return (tDuty r d 0 DoNothing (abs n2) 1)

rpr :: UId m => UGen -> UGen -> m UGen
rpr n = tRandM (in' 1 KR n) (in' 1 KR (n + 1))

tgr_rpr :: (Functor m,UId m) => m UGen
tgr_rpr = do
  clk <- dustR' AR (in' 1 KR 0) (in' 1 KR 1)
  rat <- rpr 2 clk
  dur <- rpr 4 clk
  pos <- fmap (* bufDur KR 10) (rpr 8 clk)
  pan <- rpr 10 clk
  amp <- rpr 6 clk
  return (tGrains 2 clk 10 rat pos dur pan amp 2)

preset :: [Double]
preset =
    [0.01,0.02
    ,0.95,1.05
    ,0.02,0.06
    ,0.6,0.7
    ,0.7,0.9
    ,-1.0,1.0]

rSet :: [(Double, Double)]
rSet =
    [(0.005,0.025),(0.05,0.25)
    ,(0.75,0.95),(1.05,1.25)
    ,(0.001,0.01),(0.02,0.04)
    ,(0.4,0.5),(0.7,0.8)
    ,(0.0,0.45),(0.55,1.0)
    ,(-1.0,0.0),(0.0,1.0)]

edit :: Transport m => m ()
edit = do
  s <- mapM (uncurry rrand) rSet
  send (c_setn [(0,s)])
  wait 0.35

run :: (UId m,Transport m) => m ()
run = do
  let sf = "/home/rohan/data/audio/pf-c5.snd"
  _ <- async (b_allocRead 10 sf 0 0)
  send (c_setn [(0,preset)])
  play . out 0 =<< tgr_rpr
  wait 0.3
  _ <- sequence (replicate 64 edit)
  reset

main :: IO ()
main = withSC3 run
