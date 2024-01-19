// k-ppr
var x = MouseX.kr(0.05, 0.35, 'linear', 0.1);
var y = MouseY.kr(0.15, 0.75, 'linear', 0.1);
var ti = LFTri.kr(x, 0);
var tf = ti.range(100, 200);
var t = Impulse.ar(tf, 0);
var stream = { arg lf, rf, ld, rd, g;
	{
		var r1 = Rand.ir(9, 18);
		var t_ = PulseDivider.ar(t, r1, 0);
		var r2 = TRand.ar(lf, ti.range(lf, rf), t_);
		var r3 = TRand.ar(ld, rd, t_);
		Ringz.ar(Decay2.ar(t_, 0.01, 0.5), r2, r3 * y) * g
	}
};
var s1 = stream.value(3140, 6240, 0.050, 0.005, 0.15);
var s2 = stream.value(0400, 9000, 0.005, 0.005, 0.15);
Array.fill(2, s1) + Array.fill(2, s2)
