{- https://sccode.org/1-5aJ (fl) ; chaos engine hum -}
let o = SinOsc(101, Saw(0.12345) * 678 + 9) * 0.2 + 0.8;
let p = Pulse([25, 25.5], 0.25) * 0.125 - 0.25;
let f = SinOsc([50, 51], 0) * o + p * 50 + 10;
SinOsc(f.kr, 0) * 0.5
