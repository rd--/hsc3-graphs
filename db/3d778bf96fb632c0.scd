// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 15, doneAction: 2), 0);
Pan2.ar(SinGrain.ar(tr, 0.05, TRand.kr(322, 3222, tr)) * 0.1, 0, 1)
