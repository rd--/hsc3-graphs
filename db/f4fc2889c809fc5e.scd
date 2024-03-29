// Bezier ; event control
Voicer(0, 4) { |e|
    var w = { |l r|
        LFDNoise3.ar(freq: e.j * 5).range(lo: l, hi: r)
    };
    {
        var p = [
			0, 0,
			w.value(0.05, 0.25), -1.3,
			w.value(0.25, 0.45), -1.3,
			0.5, 0,
			w.value(0.55, 0.75), 1.3,
			w.value(0.75, 0.95), 1.3,
			1, 0
		];
        var o = Bezier.ar(freq: w.value(200, 205) * (e.x + 0.5), phase: 0, param: p);
        Pan2.ar(in: o, pos: e.i * 2 - 1, level: e.z * LagUD.kr(in: e.w, lagTimeU: 0.01, lagTimeD: e.y * 4))
    }.dup(4).sum
}.sum
