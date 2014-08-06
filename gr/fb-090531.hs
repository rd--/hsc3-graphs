-- fb-090531 (rd)

import Control.Monad {- base -}
import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Random.IO {- hsc3-lang -}

fb_090531 :: UGen
fb_090531 =
    let k_in n = linLin_b (in' 1 KR n)
        p = localIn' 1 AR
        bt = recip controlRate
        ig_f = k_in 0 1 20
        ig = impulse AR ig_f 0
        f_f = k_in 1 220 880
        f_rq = k_in 2 0.005 0.2
        f = bpf ig f_f f_rq
        d_t = k_in 3 0.1 0.105
        d = delayC (f + p) 1 (d_t - bt)
    in mrg [p,localOut d]

-- | Constant reset.
c_reset :: Transport m => Double -> m ()
c_reset n = send (c_setn [(0,replicate 4 n)])

-- | Random reset.
r_reset :: Transport m => m ()
r_reset = do
  cs <- replicateM 4 (rrand (-1) 1)
  send (c_setn [(0,cs)])

-- | Loop random reset.
lr_reset :: Transport m => Double -> m b
lr_reset t = pauseThread t >> r_reset >> lr_reset t

-- | Start fb_090531 and run lr_reset.  Type C-cC-i to interrupt.
main :: IO ()
main = do
  audition (offsetOut 0 fb_090531)
  withSC3 (c_reset 1 >> lr_reset 1)

{-
withSC3 (c_reset 0)
withSC3 (c_reset 1)
withSC3 (c_reset (-1))
withSC3 r_reset
-}
