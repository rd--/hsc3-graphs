// Something awfully old ; https://github.com/lukiss/Losers-Union-SC-Research
var a = LocalBuf(8 * 2048, 1);
var f = { LFDNoise3.kr(0.001 ! 7).tan.abs };
RecordBuf.ar(LFDNoise3.ar(500) + (PinkNoise.ar() * 8), a, 0, 1, 0, 1, 0, 1, 0);
Splay.ar(
	LeakDC.ar(
		CombC.ar(
			Warp1.ar(1, a, f, f * 0.03, Array.series(4, 1 / 7, 1 / 7) * 0.12, -1, 4, 0, 4),
			0.4,
			0.4,
			2
		).softclip,
		0.995
	)
)
