// synthetic piano (jmcc) #3;
var p = {
	var n = 36.rrand(90);
	var f = 0.1.rrand(0.5);
	var ph = 0.0.rrand(1.0);
	var s = Impulse.ar(f, ph) * 0.1;
	var e = Decay2.ar(s, 0.008, 0.04);
	var c = {
		arg i;
		var n0 = LFNoise2.ar(3000);
		var o = [-0.05, 0, 0.04].at(i);
		var dt = 1 / (n + o).midicps;
		CombL.ar(n0 * e, dt, dt, 6)
	};
	var l = ((n - 36) / 27) - 1;
	var c_ = Mix.fill(3, c);
	Pan2.ar(c_, l, 1)
};
Mix.fill(2, p)
