-- https://twitter.com/headcube/status/474064500564324352 (nv)
-- https://soundcloud.com/nathaniel-virgo/supercollider-tweet-from-4614
-- requires -m at scsynth
-- inaccurate...

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Protect {- hsc3-rw -}

-- > audition (out 0 p)
p :: UGen
p = lfPulse AR (2 ** rand 'α' (-9) 1) (rand 'β' 0 2 / 2) 0.5

q :: Int -> UGen
q i = product (uclone_seq (const False) 'γ' (i + 2) p) / (1 + constant i) + 1

-- > audition (out 0 s)
s :: UGen
s =
    let f = product (uprotect_seq (const False) 'δ' (map q [0 .. 7])) * 86
    in pluck (sin (bpf f f 1)) (saw AR 440) 1 (1 / f) 9 0.5

nv :: UGen
nv = splay (uclone_all 'ε' 9 s) 1 1 0 True

-- > audition (out 0 nv_opt)
nv_opt :: UGen
nv_opt = ugen_optimise_const_operator (ugen_optimise_ir_rand nv)

-- > via_disk (out 0 nv)
via_disk :: UGen -> IO ()
via_disk u = do
  let sy = synthdef "nv" u
  synthdefWrite_dir "/tmp" sy
  withSC3 (async (d_load "/tmp/nv.scsyndef") >> sendMessage (s_new "nv" (-1) AddToHead 1 []))

main :: IO ()
main = audition (out 0 nv_opt)
