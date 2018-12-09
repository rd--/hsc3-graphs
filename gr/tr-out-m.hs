-- tr-out (rd)

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}

sig_0 :: UGen -> UGen
sig_0 mnn = sinOsc AR (midiCPS mnn) 0

sig_1 :: UGen -> UGen -> UGen
sig_1 _stp mnn = sig_0 mnn * control KR "amp" 0.1

tr_0 :: UGen -> UGen -> (UGen, UGen, UGen) -> UGen
tr_0 t n (mnn,_loc,_amp) = sendTrig t n mnn

tr_1 :: UGen -> UGen -> (UGen, UGen, UGen, UGen) -> UGen
tr_1 t n (mnn,loc,amp,stp) = sendReply t n "/tr_out" [mnn,loc,amp,stp]

-- mnn = midi note number, loc = stereo location, amp = linear amplitude, stp = stop/voice
tr_nd_m :: UId m => UGen -> m (UGen,UGen)
tr_nd_m n = do
  t <- dustM KR 1.6
  r1 <- tRandM 0 6 t
  r2 <- tRandM 0 6 t
  r3 <- tRandM 0 6 t
  r4 <- tRandM 0 6 t
  let mnn = bufRdN 1 KR 0 r1 NoLoop
      loc = bufRdN 1 KR 1 r2 NoLoop
      amp = bufRdN 1 KR 2 r3 NoLoop
      stp = bufRdN 1 KR 3 r4 NoLoop
  return (pan2 (sig_1 stp mnn) loc amp
         ,tr_1 t n (mnn,loc,amp,stp))

tr_out_degree :: Num n => n
tr_out_degree = 6

tr_out_m :: UId m => m UGen
tr_out_m = do
  ns <- mapM tr_nd_m [1 .. tr_out_degree]
  let o = sum (map fst ns)
  return (mrg (o : map snd ns))

tr_out :: UGen
tr_out = uid_st_eval tr_out_m

tr_out_nid :: Node_Id
tr_out_nid = 100

act :: (UId m,Transport m) => m ()
act = do
  _ <- async (b_alloc_setn1 0 0 [60,62,64,65,67,69])
  _ <- async (b_alloc_setn1 1 0 [-1,-0.5,0,0.25,0.75,1.0])
  _ <- async (b_alloc_setn1 2 0 [0.01,0.05,0.1,0.15,0.25,0.35])
  _ <- async (b_alloc_setn1 3 0 [0,0,0,0,0,0])
  play_at (tr_out_nid,AddToHead,1,[]) (out 0 (uid_st_eval tr_out_m))

main :: IO ()
main = withSC3 act
