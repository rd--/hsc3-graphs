{- http://sccode.org/1-4Qy (F0) ; 0274 ; requires=pyramid -}
let b = 1 / [1 8];
let q = ' #SuperCollider '.ascii.asList.pyramid(1);
let f = Duty(b, 0, Dseq(inf, q * 9 ^ 1.0595 / 2));
SinOsc(f, SinOsc(b, 0) * Lag(SinOsc(0 - b, 0) < 0.9, 0.1) * 5000) / 4
