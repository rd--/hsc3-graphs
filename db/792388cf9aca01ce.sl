(* 23 Mars ; https://github.com/lukiss/Losers-Union-SC-Research *)
var d = { :n |
	{
		Gendy3(1, 1, 1, 1, LfNoise1(2) + 1, 0.5, 0.5, 12, 12).Abs.RoundTo(1 / 16).kr
	} ! n
};
var t = Dust(d(5) / 2).kr;
Splay(
	FreeVerb(
		LeakDc(
			Ifft(
				PvBinScramble(
					Fft(
						{ LocalBuf(1, 4096) } ! 2,
						StandardL(d(2) * 5000, 1, 0.5, 0),
						0.5,
						0,
						1,
						0
					),
					d(1),
					d(1),
					t
				),
				0,
				0
			) * t.Lag3Ud(0.01, d(5)),
			0.995
		),
		d(1) / 3,
		d(1),
		d(1) / 2
	),
	0.5
)
