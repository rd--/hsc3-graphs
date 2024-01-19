// harmonic swimming (jmcc) #1
var a = 0.02; // amplitude scale
var f = 50; // fundamental frequency
var p = 20; // number of partials per channel
var l = Line.kr(0, a.neg, 60); // amplitude offset, causes sound to separate and fade
var o = {
	arg h;
	var r = 6 + [4.0.rand2, 4.0.rand2]; // amplitude rate
	var n = LFNoise1.kr(r) * a + l;
	var e = 0.max(n); // clip negative amplitudes to zero
	FSinOsc.ar(f * (h + 1), 0) * e };
	(0 .. p).collect(o).sum
