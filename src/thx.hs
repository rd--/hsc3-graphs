-- thx (perry cook)
-- http://ccrma-mail.stanford.edu/pipermail/stk/2007-January/000327.html

import Sound.SC3
import System.Random

type R = Double

rvb :: UGen -> R -> UGen
rvb i rT =
    let d = mce [0.0297,0.0371,0.0411,0.0437]
        c = mix (combN i 0.05 d (constant rT) * 0.25)
        f = (allpassN c 0.01 0.005 0.096835)
    in allpassN f 0.01 0.0017 0.032924

mk_env :: R -> R -> R -> R -> R -> R -> R -> EnvCurve -> UGen
mk_env z0 t0 z1 t1 t2 z2 t3 c =
    let z = map constant [z0,z1,z1,z2,z2]
        t = map constant [t0,t1,t2,t3]
        e = Envelope z t [c,c,c] Nothing Nothing
    in envGen KR 1 1 0 1 RemoveSynth e

mk_saw :: R -> R -> R -> UGen -> UGen
mk_saw t4 f0 f1 l =
    let f = mk_env f0 t0 f0 t1 t2 f1 (t3 + t4 + t5 + t5) EnvLin
        g = mk_env 0 t0 0.1 (t1 + t2 + t3) t4 0.0 (t5 + t5) EnvLin
        s = saw AR f
        t0 = 0.035
        t1 = 0.2267573696
        t2 = 2.2675736061
        t3 = 6.8027210884
        t5 = 1.75
    in pan2 s l g

thx :: UGen
thx =
    let t4 = 7.9365079365
        s = sum (zipWith3 (mk_saw t4) f0 f1 l)
        n = 30
        l = take n (randomRs (-1.0,1.0) (mkStdGen 1))
        f = [29,87.5,116,175,233,350,524,880,1048,1760]
        f0 = take n (randomRs (200.0,800.0) (mkStdGen 2))
        f1 = take n (cycle f)
    in rvb s t4

main :: IO ()
main = audition (out 0 thx)
