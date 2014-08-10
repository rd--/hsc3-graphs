-- tr-out (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

tr_nd :: UId m => UGen -> m (UGen,UGen)
tr_nd n = do
  t <- dustM KR 1.6
  r1 <- tRandM 0 6 t
  r2 <- tRandM 0 6 t
  r3 <- tRandM 0 6 t
  let f = midiCPS (bufRdN 1 KR 0 r1 NoLoop)
      p = bufRdN 1 KR 1 r2 NoLoop
      a = bufRdN 1 KR 2 r3 NoLoop
  return (pan2 (sinOsc AR f 0) p a
         ,sendTrig t n (f / 660))

tr_out :: UId m => m UGen
tr_out = do
  ns <- mapM tr_nd [1..4]
  let o = sum (map fst ns)
  return (mrg (o : map snd ns))

act :: (UId m,Transport m) => m ()
act = do
  _ <- async (b_alloc_setn1 0 0 [60,62,64,65,67,69])
  _ <- async (b_alloc_setn1 1 0 [-1,-0.5,0,0.25,0.75,1.0])
  _ <- async (b_alloc_setn1 2 0 [0.01,0.05,0.1,0.15,0.25,0.35])
  play . out 0 =<< tr_out

main :: IO ()
main = withSC3 act
