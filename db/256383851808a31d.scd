// 3 Nov 2018 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = 9;
var f = { | b |
	LFNoise2.kr(b.sign).exprange(9, b)
};
Splay.ar(
	LeakDC.ar(
		Formant.ar(
			({ a = a + 7 } ! 6).midicps * ({ f.(99).round(12) } ! 6).midiratio,
			{ f.(2200) } ! 6,
			{ f.(300) } ! 6
		) * SinOscFB.kr(
			f.(0.05),
			{ f.(0.5) } ! 6
		),
		0.995
	)
) / 13
