// cymbalism (jmcc) #2
{
	var p = 15;
	var f1 = Rand.ir(500, 2500);
	var f2 = Rand.ir(0, 8000);
	var y = {
		var f = Array.fill(p, {f1 + Rand.ir(0, f2)});
		var rt = Array.fill(p, {1 + Rand.ir(0, 4)});
		`[f, nil, rt]
	};
	var z = Array.fill(2, y);
	var t = Impulse.ar(Rand.ir(0, 3) + 0.5, 0);
	var n = WhiteNoise.ar * 0.03;
	var s = Decay.ar(t, 0.004) * n;
	Klank.ar(z, s)
}.xfade(4, 4)
