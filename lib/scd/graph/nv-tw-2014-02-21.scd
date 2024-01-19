// https://twitter.com/headcube/status/437094206767513600 ; sometimes eventually unstable here (2021-09-24)
var f = {
	var x = Impulse.ar(0.05, 0);
	var p = {
		var a = AllpassL.ar(LeakDC.ar(x, 0.995), 4, 8 ** LFNoise2.kr(0.1) / 2, 8) * 1.2;
		x = LPF.ar(a, 8 ** LFNoise2.kr({0.1.rand}.dup) * 2500).tanh
	};
	20.do(p);
	x * 5
};
Mix.fill(4, f)
