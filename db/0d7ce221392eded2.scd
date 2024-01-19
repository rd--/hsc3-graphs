// https://twitter.com/headcube/status/387489141274857472 (nv) - not stable here (2014-06-14)
var x = Saw.ar(0.7 ** LFNoise0.kr(1 / 5).lag(2) * #[601, 500, 749]);
var f =	{ |i|
	var a = 0.9 ** i;
	x = x + BAllPass.ar(x, 9 ** LFNoise0.kr(a) * 2000) + CombL.ar(x, 1, a, 8) / 2.1
};
Splay.ar(f.dup(9) @ 8)
