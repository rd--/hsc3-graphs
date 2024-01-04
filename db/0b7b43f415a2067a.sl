(* https://sccode.org/1-4Qy ; f0 ; 0307 *)
var a = 2 + Blip(3 / [8, 9], 2).RoundTo(1);
var c = a ^ Lag(a, 0.1);
var o = Blip(
	Duty(
		1 / [9, 8],
		0,
		Dseq(inf, 'AVVVF'.ascii.asArray.MidiCps / a)
	),
	c
) * (c + 5);
CombN(o, 0.2, 0.2, 1).Tanh * 0.15
