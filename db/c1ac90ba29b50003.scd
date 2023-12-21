// 9 Jan 2019 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = 40;
var f = { | b |
	LFNoise1.kr(1).exprange(10, b)
};
Splay.ar(
	LeakDC.ar(
		Formant.ar(
			({ a = a + 5 } ! 6).midicps * ({ f.(29).round(7) } ! 6).midiratio,
			{ f.(1000) } ! 6,
			{ f.(500) } ! 6
		),
		0.995
	)
) / 13
