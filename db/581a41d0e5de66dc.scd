// f0 ; https://twitter.com/redFrik/status/1136928201886904320
var f = { arg osc, ix;
	var b = #[4, 2, 1, 3, 5];
	var c = (osc.ar(1 / b, 0) * b).round(osc.ar(b / 9, 0) > 0);
	var o = SinOscFB.ar(c ** 2 * ((osc.ar(0.02, ix) > 0) + 1 * 50), osc.ar(c / 9, 0) % 1);
	var s = o * 0.max(osc.ar(1 / b * osc.ar(b / 99, ix), 0)) * osc.ar(0.01, ix);
	var x = AllpassC.ar(s, 1, c.wrap(0.5, 1), 2);
	var y = BPF.ar(x, ix * 99 + 400, 0.001) * (osc.ar(0.04, ix) + 1 * 9);
	Splay.ar(x + y) / 3
};
Mix.ar([LFTri, LFSaw, LFPar].collect(f))
