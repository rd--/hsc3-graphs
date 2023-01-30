;; additive saw
var f = 100;
var t = Impulse(1 / 3, 0);
var dt = [1.4, 1.1, 2, 1, 1.8, 2.9, 4, 0.3, 1, 3.6, 2.3, 1.1];
var v = { :n | SinOsc(f * n, 0) * Decay2(t, 0.01, dt[n]) / n };
1.to(12).collect(v).sum * 0.1
