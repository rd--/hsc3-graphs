;; https://scsynth.org/t/6452 ; requires=SinGrain
var tr = Impulse(100 * Line(0.1, 10, 15, 2), 0);
Pan2(SinGrain(tr, 0.05, TRand(322, 3222, tr)) * 0.1, 0, 1)
