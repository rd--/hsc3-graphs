;; Dfm1
var in = Pulse([100, 100.1], 0.5).sum * 0.4;
var freq = SinOsc(SinOsc(0.3, 0).Range(0.2, 5), 0).Range(80, 2000);
Dfm1(in, freq, 1.1, 2, 0, 0.0003) * 0.2
