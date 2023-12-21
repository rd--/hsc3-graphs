// 22 Maj 2021 ; https://github.com/lukiss/Losers-Union-SC-Research
var n = 4;
var l = { | mul |
	(LFDNoise3.kr(0.05 ! n) * mul).abs
};
var d = {
	Demand.ar(
		Impulse.ar(1 / (30 .. 53).choose, 0),
		0,
		Dxrand((7 .. 53).degreeToKey([0, 1, 4, 5, 7, 9, 10], 12).midicps, inf)
	)
};
Splay.ar(
	HPF.ar(
		CombC.ar(
			PMOsc.ar(
				d ! n,
				d ! n,
				l.(2),
				l.(0.5)
			) * (l.(0.25) + 1 / 4),
			1 / 4,
			1 / 4 - l.(1 / 16),
			7
		),
		110,
	) * -12.dbamp
)
