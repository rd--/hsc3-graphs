{- http://sccode.org/1-4Qy (F0) ; 0246 -}
let b = (1 .. 9) * 1.5;
let d = [2 / b, 3 / b];
let e = LfPulse(d, 0, 0.5);
CombC(
	Ringz(e, (LfPulse(1 / b, 0, 0.5) * b + 50).MidiCps, b / 9).Sum * 0.0002,
	2,
	2 - Lpf(e, 50),
	1
).transposed.Mix
