{- http://sccode.org/1-4Qy (F0) ; 0307 -}
let a = 2 + Blip(3 / [8, 9], 2).RoundTo(1);
let c = a ^ Lag(a, 0.1);
let o = Blip(
	Duty(
		1 / [9, 8],
		0,
		Dseq(inf, 'AVVVF'.ascii.asArray.MidiCps / a)
	),
	c
) * (c + 5);
CombN(o, 0.2, 0.2, 1).Tanh * 0.15
