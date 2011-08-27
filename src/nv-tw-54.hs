-- nv-tw-54 (nv)
-- http://sccode.org/1-V

import Sound.SC3
import Sound.SC3.Lang.Pattern.ID

fF :: Double -> Double -> Double
fF i f =
    let n = (((2 * i) `modE` 6 + 1) + ffloor f) / (i `modE` 5 + 1)
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
main = audition (nvi,pbind [("f",fromList fS)
                           ,("i",pseries 0 1 inf)
                           ,("dur",0.3)])

{-
f=0;
{inf.do{|i|
n=((((2*i)%6)+1)+floor(f))/((i%5)+1);
f=(f+log2(n))%2;
e=Line.kr(0.1,0,1,1,0,2);
play{SyncSaw.ar(2**f*99+[0,1],i%8+2*52)*e};
0.3.wait}}.r.play
-}
