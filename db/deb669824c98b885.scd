// https://scsynth.org/t/6452
var tr = Impulse.kr(100 * Line.kr(0.1, 10, 30, 2), 0);
Pan2.ar(GrainFM.ar(2, tr, 10, TRand.kr(322, 3222, tr), TRand.kr(322, 3222, tr), 1, WhiteNoise.ar * 0.6, -1, 128), 0, 1 / 64)
