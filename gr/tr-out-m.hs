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
tr_nd :: UId m => UGen -> m (UGen,UGen)
tr_nd n = do
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
  ns <- mapM tr_nd [1 .. tr_out_degree]
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
  play_at (tr_out_nid,AddToHead,1,[]) (out 0 tr_out)

main :: IO ()
main = withSC3 act

-- > set_master 0.075 -- 0.075 0.1 0.115
set_master :: Double -> IO ()
set_master n = withSC3 (sendMessage (n_set1 tr_out_nid "amp" n))

wr_param :: Buffer_Id -> [Double] -> IO ()
wr_param k n = withSC3 (sendMessage (b_setn1 k 0 n))

wr_mnn :: [Double] -> IO ()
wr_mnn = wr_param 0

wr_pan :: [Double] -> IO ()
wr_pan = wr_param 1

wr_amp :: [Double] -> IO ()
wr_amp = wr_param 2

wr_stp :: [Double] -> IO ()
wr_stp = wr_param 3

{-

wr_mnn [60, 62, 64, 65, 67, 69]
wr_mnn [40, 52, 54, 65, 67, 69]
wr_mnn [40, 52, 54, 67, 79, 87]
wr_mnn [40, 52, 54, 67, 79, 87]
wr_mnn [45, 52, 53, 66, 67, 79]
wr_mnn [52, 53, 66, 67, 78, 79]
wr_mnn [52, 55, 65, 67, 77, 79]
wr_mnn [53, 55, 67, 69, 77, 79]
wr_mnn [40, 41, 42, 67, 69, 77]
wr_mnn [40, 41, 44, 67, 69, 77]
wr_mnn [40, 41, 44, 67, 69, 77]
wr_mnn [50, 51, 54, 67, 69, 77]
wr_mnn [60, 62, 64, 65, 67, 69]

wr_mnn [60.0,61.932,63.863,65.034,66.968,68.897]
wr_mnn [60,60.5,61,61.5,65,66.5,67]

wr_pan [-1, -0.5, 0, 0.25, 0.75, 1]
wr_pan [-1, -0.5, 0, 0.25, 0.75, 1.0]
wr_pan [-1, -0.9, -0.8, 0.8, 0.9, 1.0]
wr_pan [-0.2, -0.1, -0.0, 0.0, 0.1, 0.2]
wr_pan [0, 0.15, 0.2, 0.25, 0.75, 1.0]

wr_amp [0.01, 0.05, 0.1, 0.15, 0.25, 0.35]
wr_amp [0.01, 0.02, 0.05, 0.075, 0.1, 0.125, 0.15]
wr_amp [0.001, 0.002, 0.005, 0.0075, 0.01, 0.0125, 0.015]
wr_amp [0, 0, 0, 0, 0, 0, 0]

wr_stp [0,0,0,0,0,0]
wr_stp [2,2,2,2,2,2]
wr_stp [4,4,4,4,4,4]
wr_stp [6,6,6,6,6,6]
wr_stp [7,7,7,7,7,7]
wr_stp [0,0,0,1,1,1]
wr_stp [0,0,0,2,2,2]
wr_stp [0,0,0,6,6,6]
wr_stp [6,6,6,7,7,7]
wr_stp [0,0,1,1,2,2]
wr_stp [0,0,4,4,6,6]
wr_stp [1,1,5,5,7,7]
wr_stp [0,0,1,1,2,3]
wr_stp [0,1,2,3,4,5]
wr_stp [0,0,0,0,0,4]

-}
