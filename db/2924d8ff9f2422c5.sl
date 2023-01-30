;; https://scsynth.org/t/6452
var tr = Impulse(100 * Line(0.1, 10, 15, 2), 0);
Pan2(GrainSin(2, tr, 1, TRand(322, 3222, tr), WhiteNoise() * 0.6, -1, 2048), 0, 1 / 64).transpose.sum
