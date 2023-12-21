// 23 Mars ; https://github.com/lukiss/Losers-Union-SC-Research
var d = { | n |
	{
		Gendy3.kr(1, 1, 1, 1, LFNoise1.kr(2) + 1, 0.5, 0.5, 12, 12).abs.round(1 / 16)
	} ! n
};
var t = Dust.kr(d.(5) / 2);
Splay.ar(
	FreeVerb.ar(
		LeakDC.ar(
			IFFT.ar(
				PV_BinScramble(
					FFT(
						{ LocalBuf(4096, 1) } ! 2,
						StandardL.ar(d.(2) * 5000, 1, 0.5, 0),
						0.5,
						0,
						1,
						0
					),
					d.(1),
					d.(1),
					t
				),
				0,
				0
			) * t.lag3ud(0.01, d.(5)),
			0.995
		),
		d.(1) / 3,
		d.(1),
		d.(1) / 2
	),
	0.5
)
