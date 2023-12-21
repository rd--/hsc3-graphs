// 12 May 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = { | freq mul |
	(LFDNoise3.kr(freq) * mul).abs
};
var i = 1 / 16;
var t = Impulse.kr(l.(pi, pi), 0);
CombC.ar(
	Splay.ar(
		{
			SinOsc.ar(
				Demand.kr(
					t,
					0,
					Drand((9 .. 42).degreeToKey([0, 2, 4, 7, 9], pi * pi),inf)
				).midicps,
				0
			) * (t.lag3ud(0, i) + (t.lag3ud(i + l.(9, i * 4), l.(pi, pi)) / pi))
		} ! 5
	),
	i,
	i,
	pi
)
