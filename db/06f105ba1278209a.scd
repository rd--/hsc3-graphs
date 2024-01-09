// https://scsynth.org/t/6452
var f = {
	arg p;
	var f1 = p.first, f2 = p.second, l1 = 0.5, l2 = 2;
	var o1 = { SinOsc.ar(TRand.kr(f1, f2, Impulse.kr(10, 0)) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	var o2 = { SinOsc.ar(TRand.kr(f1, f2, Impulse.kr(10, 0)) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	Pan2.ar(o1 + o2, 0, 1 / 128)
};
f.value([[20, 20000], [20, 2000], [200, 2000], [20, 200]].choose)
