// 20060909 ; rd
var x = MouseX.kr(0.001, 0.02, 1, 0.1);
var y = MouseY.kr(120, 400, 1, 0.1);
var p = {
	var f = LFNoise0.kr(4) * [32, 64];
	var w = LFNoise0.kr(32) * x;
	var z = LFNoise0.kr(2) * 0.1;
	var m = LFNoise0.kr(6);
	var s = Pulse.ar(f, w);
	Resonz.ar(s, y + z, (m * 0.4) + 0.8) * 0.5
};
var q = {
	var n = LFNoise0.kr(128);
	CombN.ar(p.value, 0.2, (n * 0.1) + 0.1, 3)
};
var r = {
	var x1 = MouseX.kr(0.75, 1.25, 1, 0.1);
	var y1 = MouseY.kr(0.25, 1, 1, 0.1);
	var f = {
		var fr = Rand(50, 59) * x1;
		var am = Rand(0.04, 0.16) * y1;
		SinOsc.ar(fr, 0) * am
	};
	{ f.dup(16).sum }.dup(2)
};
p.value + q.value + r.value
