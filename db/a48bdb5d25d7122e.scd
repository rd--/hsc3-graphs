// Bezier - dynamic shifting of control points, as oscillator
var w = {
	arg l, r;
	LFDNoise3.ar(freq: 2).range(lo: l, hi: r)
};
var f = {
	var p = [0, 0, w.value(0.05, 0.25), -1.3, w.value(0.25, 0.45), -1.3, 0.5, 0, w.value(0.55, 0.75), 1.3, w.value(0.75, 0.95), 1.3, 1, 0];
	var o = Bezier.ar(freq: w.value(200, 205), phase: 0, param: p);
	Pan2.ar(in: o, pos: IRand.new(lo: -1, hi: 1), level: 0.1)
};
f.dup(4).sum
