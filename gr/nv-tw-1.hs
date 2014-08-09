-- http://sccode.org/1-V (nv)

import Sound.SC3 {- hsc3 -}

nv_tw_1 :: UGen
nv_tw_1 =
    let a = uclone 'α' 2 (pinkNoise 'β' AR)
        nd z =
            let n = lfNoise1 'γ' KR (rand 'δ' 0 0.05)
                f = linExp n (-1) 1 40 15000
            in bBandStop z f (expRand 'ε' 0.1 2)
    in lpf (useq 'ζ' 50 nd a) 1e5

main :: IO ()
main = audition (out 0 nv_tw_1)
