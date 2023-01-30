;; Formlet ; parameters randomised on trigger ; stereo
var i = Impulse(LfNoise2([0.15, 0.6]) * 15 + 15, 0.5);
Formlet(i, TRand(30, [150, 600], i), TRand(0.01, [0.15, 0.6], i), TRand(0.05, [0.15, 0.6], i)) * 0.25
