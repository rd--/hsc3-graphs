(* Something awfully old ; https://github.com/lukiss/Losers-Union-SC-Research ; requires=kr *)
var a = LocalBuf(1, 8 * 2048);
var f = {
	LfdNoise3(0.001 ! 7).Tan.Abs.kr
};
Splay(
	LeakDc(
		CombC(
			Warp1(
				1,
				a,
				f(),
				f() * 0.03,
				4.arithmeticSeries(1 / 7, 1 / 7) * 0.12,
				-1,
				4,
				0,
				4
			),
			0.4,
			0.4,
			2
		).SoftClip,
		0.995
	)
) <! RecordBuf(a, 0, 1, 0, 1, 0, 1, 0, LfdNoise3(500) + (PinkNoise() * 8))
