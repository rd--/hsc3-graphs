-- nv-tw-1 (nv)
-- http://sccode.org/1-V

import Sound.SC3.ID

nv_tw_1 :: UGen
nv_tw_1 =
    let a = udup 2 (pinkNoise 'a' AR)
        nd z =
            let f = linExp (lfNoise1 'a' KR (rand 'a' 0 0.05)) (-1) 1 40 15000
            in bBandStop z f (expRand 'a' 0.1 2)
    in lpf (useq 'a' 50 nd a) 1e5

main :: IO ()
main = audition (out 0 nv_tw_1)

{-
{a=PinkNoise.ar(1!2)
;50.do{
    f=LFNoise1.kr(0.05.rand).exprange(40,15000)
   ;a=BBandStop.ar(a,f,exprand(0.1,2))}
;LPF.ar(a,1e5)
}.play
-}
