// https://scsynth.org/t/6452
var f = {
	arg p;
	var f1 = p[0], f2 = p[1], l1 = 0.125, l2 = 8;
	var o1 = { SinOsc.ar(Rand(f1, f2) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	var o2 = { SinOsc.ar(Rand(f1, f2) * Line.kr(l2, l1, 60, 2), 0) }.dup(128).sum;
	Pan2.ar(o1 + o2, 0, 1 / 128)
};
f.value([[20, 20000], [20, 200], [200, 2000], [2000, 20000]].choose)
