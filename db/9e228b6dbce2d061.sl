;; Hpf
var c = Hpf(LfSaw(5, 0), SinOsc(XLine(0.07, 30, 20, 0), 0) * 35 + 40);
SinOsc(c * 200 + 500, 0) * 0.1
