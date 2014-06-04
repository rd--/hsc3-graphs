-- sc-users, 2014-06-03 (nv)

import Sound.SC3 {- hsc3 -}

nv_ml_2014_06_03 :: UGen
nv_ml_2014_06_03 =
    let y = mouseY KR 1 100 Linear 0.2
        x = mouseX KR 50 400 Exponential 0.2
        i = decay (impulse AR 0.5 0) 0.1
        i' = sin (bpf (i * y) 50 1)
    in pluck i' (lfSaw AR 10000 0) 0.1 (1 / x) 4 0.5

repl :: Int -> UGen -> UGen
repl n = mce . replicate n

main :: IO ()
main = audition (out 0 (repl 2 nv_ml_2014_06_03))
