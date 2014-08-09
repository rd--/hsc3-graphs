-- https://twitter.com/headcube/status/474064500564324352 (nv)
-- requires -m at scsynth
-- inaccurate...

import Sound.SC3 {- hsc3 -}

-- > audition (out 0 p)
p :: UGen
p = lfPulse AR (2 ** rand 'α' (-9) 1) (rand 'β' 0 2 / 2) 0.5

q :: Int -> UGen
q i = product (uclone' 'γ' (i + 2) p) / (1 + constant i) + 1

-- > audition (out 0 s)
s :: UGen
s =
    let f = product (uprotect' 'δ' (map q [0 .. 7])) * 86
    in pluck (sin (bpf f f 1)) (saw AR 440) 1 (1 / f) 9 0.5

nv :: UGen
nv = splay (uclone 'ε' 9 s) 1 1 0 True

-- > audition (out 0 nv_opt)
nv_opt :: UGen
nv_opt = ugen_optimise_const_operator (ugen_optimise_ir_rand nv)

-- > via_disk (out 0 nv)
via_disk :: UGen -> IO ()
via_disk u = do
  let sy = synthdef "nv" u
  synthdefWrite sy "/tmp"
  withSC3 (async (d_load "/tmp/nv.scsyndef") >> send (s_new "nv" (-1) AddToHead 1 []))

main :: IO ()
main = audition (out 0 nv_opt)
