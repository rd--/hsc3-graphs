// oscillator cluster (rd)
var np = 12;
var prt = { arg d, a;
	{ arg cf;
		var rln = { arg r, a, b, d;
			Line.kr(a + Rand(0, r), b, d, 1)
		};
		var f = [cf, Rand(cf, cf + 2)] + (SinOsc.kr(rln.value(1, 5, 0.01, d), 0) * rln.value(10, 20, 0, d));
		SinOsc.ar(f,0) * Decay2.ar(Impulse.ar(0, 0), Rand(0.1, 0.2), d) * a
	}
};
var fp = {Rand(220, 660)}.dup(np);
fp.collect(prt.value(Rand(4, 7), Rand(0.01, 0.05))).sum
