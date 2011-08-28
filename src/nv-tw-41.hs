-- nv-tw-41 (nv)
-- http://sccode.org/1-V

import Sound.SC3.ID

nv_tw_41 :: UGen
nv_tw_41 =
    let nd i =
            let t = (0.6 ** i) * 40 * impulse AR ((2 ** i) / 32) (1/2)
                f = (4 ** lfNoise0 i KR (1/16)) * 300
            in sin (rlpf t f 5e-3)
        x = splay (mce (map nd [0..7])) 1 1 0 True
        r u = let (p,q) = mce2c u in freeVerb2 p q 0.1 1 1
    in r (r x)

main :: IO ()
main = audition (out 0 nv_tw_41)

{-
play{
x=Splay.ar({|i|
t=0.6**i*40*Impulse.ar(2**i/32,1/2);
f=4**LFNoise0.kr(1/16)*300;
RLPF.ar(t,f,5e-3).sin}!8);
2.do{x=FreeVerb2.ar(*x++[0.1,1,1])};
x}
-}
