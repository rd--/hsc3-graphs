// 5 Sep. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = {
	LFDNoise3.kr(1).abs
};
var r = { | freq mul |
	(Gendy3.kr(6, 6, l, l, freq, l, l, 5, l * 5) * mul).abs
};
-12.dbamp * Splay.ar(
	(0 .. 5).collect { | n |
		CombC.ar(
			LeakDC.ar(
				FM7.ar(
					{
						[
							80.rand.midicps,
							0,
							Blip.kr(r.(l, 24), r.(l, 228)).abs
						]
					} ! 6,
					r.(0.02,0.5) ! 6 ! 6
				)[n],
				0.995
			),
			0.5,
			0.05 + r.(0.04,l),
			1
		)
	}
)
