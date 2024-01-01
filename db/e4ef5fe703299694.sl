var s = LfNoise0(2);
var c = Changed(s, 0);
var d = Decay2(c, 0.01, 0.5);
SinOsc(440 + ([s, d] * 440), 0) * 0.1
