;; https://scsynth.org/t/6452
var tr = Impulse(1 * Line(0.1, 10, 90, 2), 0);
Pan2(GrainFm(2, tr, 0.1, TRand(322, 3222, tr), TRand(322, 3222, tr), 1, WhiteNoise() * 0.6, -1, 128), 0, 1 / 64)
