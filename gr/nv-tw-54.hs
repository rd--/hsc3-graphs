-- http://sccode.org/1-V (nv)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

fF :: Double -> Double -> Double
fF i f =
    let n = (((2 * i) `modE` 6 + 1) + floorE f) / (i `modE` 5 + 1)
    in (f + log2 n) `modE` 2

fS :: [Double]
fS =
    let lp i f = let f' = fF i f in f' : lp (i + 1) f'
    in lp 0 0

nvi :: Synthdef
nvi =
    let i = control KR "i" 0
        f = control KR "f" 0
        p = (i `modE` 8 + 2) * 52
        e = line KR 0.1 0 1 RemoveSynth
        o = syncSaw AR ((2 ** f) * 99 + mce2 0 1) p * e
    in synthdef "nvi" (out 0 o)

main :: IO ()
main =
    let fS' = map realToFrac fS
    in audition (pbind [(K_instr,psynth nvi)
                       ,(K_param "f",toP fS')
                       ,(K_param "i",pseries 0 1 inf)
                       ,(K_dur,0.3)])
