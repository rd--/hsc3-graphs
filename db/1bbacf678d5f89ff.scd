// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 15, doneAction: 2), 0);
Pan2.ar(GrainSin.ar(2, tr, 1, TRand.kr(322, 3222, tr), WhiteNoise.ar * 0.6, -1, 2048), 0, 1 / 64)
