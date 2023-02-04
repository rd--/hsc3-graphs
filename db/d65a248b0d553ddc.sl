;; red frik (f0) ; requires=kr
var tr = Impulse(0.1, 0);
var o1 = SinOsc(TRand(0.3, 5, tr), 0) * TRand(0, 0.5, tr) + TRand(0.49, 0.56, tr);
var o2 = SinOsc(o1, 0) * TRand(0.3, 0.6, tr) + TRand(0.3, 0.5, tr);
Rhpf({ BrownNoise() } ! 2, TRand(0.3, 3, tr).kr, o2.kr) * 0.1