-- nv-tw-1 (nv)
-- http://sccode.org/1-V

import Sound.SC3.ID

nv_tw_1 :: UGen
nv_tw_1 =
    let a = uclone 'a' 2 (pinkNoise 'a' AR)
        nd z =
            let n = lfNoise1 'a' KR (rand 'a' 0 0.05)
                f = linExp n (-1) 1 40 15000
            in bBandStop z f (expRand 'a' 0.1 2)
    in lpf (useq 'a' 50 nd a) 1e5

main :: IO ()
main = audition (out 0 nv_tw_1)
