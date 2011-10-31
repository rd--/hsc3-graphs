-- fb-090531 (rd)

import Sound.OpenSoundControl
import Sound.SC3
import Control.Monad
import System.Random

fb_090531 :: UGen
fb_090531 =
    let k_in n = linLin (in' 1 KR n) (-1) 1
        p = localIn 1 AR
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
c_reset :: Transport t => Double -> t -> IO ()
c_reset n fd = send fd (c_setn [(0,replicate 4 n)])

-- | Random reset.
r_reset :: Transport t => t -> IO ()
r_reset fd = do
  cs <- replicateM 4 (randomRIO (-1,1))
  send fd (c_setn [(0,cs)])

-- | Loop random reset.
lr_reset :: Transport t => Double -> t -> IO b
lr_reset t fd = pauseThread t >> r_reset fd >> lr_reset t fd

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
