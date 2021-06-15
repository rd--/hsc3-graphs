// choip choip choip ; graph re-write
{
	var t = 12;
	var z = RTexture.overlapGraph({
        arg tr;
        var tline = {arg lhs, rhs, dur, tr; LinLin.kr(in: Sweep.kr(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
        var txline = {arg lhs, rhs, dur, tr; LinExp.kr(in: Sweep.kr(trig: tr, rate: 1 / dur), srclo: 0, srchi: 1, dstlo: lhs, dsthi: rhs)};
		var impulses = Impulse.ar(
			txline.value(TExpRand.kr(1,30,tr), TExpRand.kr(1,30,tr), t, tr)
		);
		var f = txline.value(TExpRand.kr(600.0, 8000.0, tr), TExpRand.kr(600.0, 8000.0, tr), t, tr);
		Pan2.ar(
			Decay2.ar(
				impulses * txline.value(TExpRand.kr(0.01, 0.5, tr), TExpRand.kr(0.01, 0.5, tr), t, tr),
				0.01,
				0.2,
				SinOsc.ar(Decay2.ar(impulses, 0.05, 0.5, -0.9*f, f))
			),
			tline.value(TRand.kr(-1,1,tr), TRand.kr(-1,1,tr), t, tr)
		);
	}, t-2, 1, 8, 2);
	4.do({ z = AllpassN.ar(z, 0.1, [Rand.new(0,0.05),Rand.new(0,0.05)], 4) });
	z
}
