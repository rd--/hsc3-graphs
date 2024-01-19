// snare-909 (jmcc)
var snr = { arg tr, n, v;
	var e = { arg a, b;
		EnvGen.ar(Env.perc(a, b), tr, 1, 0, 1, 0)
	};
	var e1 = e.value(0.0005, 0.055);
	var e2 = e.value(0.0005, 0.075);
	var e3 = e.value(0.0005, 0.4);
	var e4 = e.value(0.0005, 0.283);
	var t1 = LFTri.ar(330, 0);
	var t2 = LFTri.ar(185, 0);
	var x1 = LPF.ar(n, 7040) * (0.1 + v);
	var x2 = HPF.ar(x1, 523);
	var m1 = (t1 * e1 * 0.25) + (t2 * e2 * 0.25);
	var m2 = (x1 * e3 * 0.20) + (x2 * e4 * 0.20);
	m1 + m2
};
var x = MouseX.kr(1, 4, 'linear', 0.2);
var y = MouseY.kr(0.25, 0.75, 'exponential', 0.2);
var t = Impulse.kr(3 * x, 0);
var n = WhiteNoise.ar;
var v = TRand.kr(0.25, 1.0, t);
Pan2.ar(snr.value(t, n, v), 0, y)
