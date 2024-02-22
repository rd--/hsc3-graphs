// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 15, 2), 0);
Pan2.ar(SinGrain.ar(tr, 0.05, TRand.kr(322, 3222, tr)) * 0.1, 0, 1)

// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 15, 2), 0);
Pan2.ar(GrainSin.ar(2, tr, 1, TRand.kr(322, 3222, tr), WhiteNoise.ar * 0.6, -1, 2048), 0, 1 / 64)

// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 30, 2), 0);
Pan2.ar(GrainFM.ar(2, tr, 10, TRand.kr(322, 3222, tr), TRand.kr(322, 3222, tr), 1, WhiteNoise.ar * 0.6, -1, 128), 0, 1 / 64)

// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 60, 2), 0);
Pan2.ar(GrainFM.ar(2, tr, 10, TRand.kr(322, 3222, tr), TRand.kr(322, 3222, Impulse.kr(100, 0)), 1, WhiteNoise.ar * 0.6, -1, 128), 0, 1 / 64)

// https://scsynth.org/t/6452
var tr = Impulse.kr(1 * Line.kr(0.1, 10, 90, 2), 0);
Pan2.ar(GrainFM.ar(2, tr, 0.1, TRand.kr(322, 3222, tr), TRand.kr(322, 3222, tr), 1, WhiteNoise.ar * 0.6, -1, 128), 0, 1 / 64)

// https://scsynth.org/t/6452
var o1 = Saw.ar([2000, 200, 1000, 4000]) * Perc.ar(Impulse.ar(5 * [2, 0.5, 0.25, 0.125], 0), 0.01, 1, -4);
var o2 = SinOsc.ar(128, 0) * Perc.ar(Impulse.ar(5 * 0.125, 0), 0.01, 1, -4);
Pan2.ar(o1.sum + o2, 0, 1 / 5)

// https://scsynth.org/t/6452
var f = {
	arg p;
	var f1 = p[0], f2 = p[1], l1 = 0.125, l2 = 8;
	var o1 = { SinOsc.ar(Rand(f1, f2) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	var o2 = { SinOsc.ar(Rand(f1, f2) * Line.kr(l2, l1, 60, 2), 0) }.dup(128).sum;
	Pan2.ar(o1 + o2, 0, 1 / 128)
};
f.value([[20, 20000], [20, 200], [200, 2000], [2000, 20000]].choose)

// https://scsynth.org/t/6452
var f = {
	arg p;
	var f1 = p[0], f2 = p[1], l1 = 0.5, l2 = 2;
	var o1 = { SinOsc.ar(TRand.kr(f1, f2, Impulse.kr(10, 0)) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	var o2 = { SinOsc.ar(TRand.kr(f1, f2, Impulse.kr(10, 0)) * Line.kr(l1, l2, 60, 2), 0) }.dup(128).sum;
	Pan2.ar(o1 + o2, 0, 1 / 128)
};
f.value([[20, 20000], [20, 2000], [200, 2000], [20, 200]].choose)
