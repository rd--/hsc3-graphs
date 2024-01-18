{- 20060927 ; rd ; requires=kr -}
let e = Decay2(Impulse({ Rand(10, 13) } ! 2, 0), 0.001, 0.005);
let f = { Rand(4, 7) } ! 2 * SinOsc({ Rand(10, 13) } ! 2, 0) * e;
let r4 = { TRand(2220, 2227, Impulse(0.7, 0)) } ! 2;
SinOsc(r4.kr, 0) * f.kr * 0.15
