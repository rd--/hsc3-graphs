-- dark sea horns (jl)
-- http://sccode.org/1-j#c51

import Sound.SC3.ID

chain :: Int -> (t -> t) -> t -> t
chain j f x = if j < 1 then x else chain (j - 1) f (f x)

dark_sea_horns :: UGen
dark_sea_horns =
    let n = lfNoise1
        x = localIn 2 AR
        a = tanh (sinOsc AR 65 (x * n 'a' AR 0.1 * 3) * (n 'b' AR 3 * 6))
        o = tanh (chain 9 (\i -> allpassN i 0.3 (dup (rand i 0.1 0.3)) 5) a)
    in mrg2 o (localOut o)

main :: IO ()
main = audition (out 0 (dark_sea_horns))

{-
Sound.SC3.UGen.Dot.draw dark_sea_horns
-}

{-
{n=LFNoise1
;x=LocalIn.ar(2)
;a=SinOsc.ar(65,x*n.ar(0.1,3),n.ar(3,6)).tanh
;9.do{a=AllpassL.ar(a,0.3,{0.2.rand+0.1}!2,5)}
;a=a.tanh
;LocalOut.ar(a)
;a}.play
-}

{-
n=LFNoise1;
Ndef(\x,{
a=SinOsc.ar(65,Ndef(\x).ar*n.ar(0.1,3),n.ar(3,6)).tanh;
9.do{a=AllpassL.ar(a,0.3,{0.2.rand+0.1}!2,5)};
a.tanh}).play
-}
