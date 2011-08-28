-- nv-tw-1 (nv)
-- http://sccode.org/1-V

import Sound.SC3.ID

chain :: Int -> (t -> t) -> t -> t
chain j f x = if j < 1 then x else chain (j - 1) f (f x)

nv_tw_1 :: UGen
nv_tw_1 =
    let a = dup (pinkNoise 'a' AR)
        nd (z,i) =
            let f = linExp (lfNoise1 i KR (rand i 0 0.05)) (-1) 1 40 15000
                z' = bBandStop z f (expRand i 0.1 2)
            in (z',succ i)
    in lpf (fst (chain 50 nd (a,'a'))) 1e5

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
