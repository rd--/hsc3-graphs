{- Additive sawtooth -}
let f = 100;
let t = Impulse(1 / 3, 0);
let dt = [1.4, 1.1, 2, 1, 1.8, 2.9, 4, 0.3, 1, 3.6, 2.3, 1.1];
(1 .. 12).collect { :n |
	SinOsc(f * n, 0) * Decay2(t, 0.01, dt[n]) / n
}.Sum * 0.1
