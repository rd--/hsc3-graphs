;; SvfLp
var f = SinOsc(XLine(0.7, 300, 20, 1), 0) * 3600 + 4000;
SvfLp(Saw(200) * 0.1, f, 1)
