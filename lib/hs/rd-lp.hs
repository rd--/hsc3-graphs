-- http://article.gmane.org/gmane.comp.lang.haskell.art/993

import Sound.SC3 {- hsc3 -}

lp :: Synthdef
lp =
    let in_bus = control KR "in_bus" 0
        out_bus = control KR "out_bus" 0
        buf_num = control KR "buf_num" 0
        lp_frames = control KR "lp_frames" 48000
        rec_level = control KR "rec_level" 1
        mute = control KR "mute" 0
        oct = control KR "oct" 1
        dir = control KR "dir" 1
        latency = control KR "latency" 256
        t_reset = tr_control "t_reset" 0
        lp_frames' = min (bufFrames KR buf_num) lp_frames
        rec_ph = phasor AR t_reset (oct * dir) 0 lp_frames' 0
        play_ph = wrap (rec_ph + latency) 0 (lp_frames' - 1)
        play_rd = bufRdL 1 AR buf_num play_ph Loop
        rec_rd = bufRdL 1 AR buf_num rec_ph Loop
        in_sig = soundIn in_bus * rec_level
        env = envGen KR (1 - mute) 1 0 1 DoNothing (envADSR 0.05 1 1 0.1 1 (EnvNum (-4)) 0)
        wr = bufWr buf_num rec_ph Loop (in_sig + rec_rd)
    in synthdef "lp" (mrg2 (out out_bus (play_rd * env)) wr)

node_id :: Int
node_id = 1000

main :: IO ()
main = withSC3 $ do
  _ <- async (b_alloc 0 (48000 * 2) 1)
  play_at (node_id,AddToHead,1,[]) lp

{-

import Sound.OSC {- hosc -}

set :: String -> Double -> IO ()
set k v = withSC3 (sendMessage (n_set1 node_id k v))

set "oct" 1.0
set "dir" 1.0
set "mute" 0.0
set "t_reset" 1.0
set "lp_frames" (48000 * 2.0)
set "rec_level" 1
set "latency" 300

-}
