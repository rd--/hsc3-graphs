(* Tennis ; https://github.com/lukiss/Losers-Union-SC-Research *)
var nf = 48000; (* sample rate *)
var b = 1000; (* LocalBuf(1, nf); *)
var n = LeakDc(
	StandardL(22050, LfNoise1(1).Range(0.72, 1.40), 0.5, 0),
	0.995
);
var z = Sweep(0, 1 - n.ExpRange(0.01, 1)) % 1 * nf;
var t = (n.Lag3(0.1) > 0);
var p = PlayBuf(
	1,
	b,
	(1 - n.RoundTo(1 / 16)) / TRand(1, z / 100, t).Lag3(0.001),
	t,
	z,
	1,
	0
);
EqPan2(
	LeakDc(
		MoogFf(
			p,
			p.ExpRange(0.01, 1) * 11025,
			2,
			0
		),
		0.995
	).SoftClip,
	TRand(-1, 1, t)
) <! RecordBuf(b, z, t, 1 - t, t, 1, t, 0, n)
