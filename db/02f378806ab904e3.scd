// SvfLp ; changing Q
var q = Line.kr(2, 0.0001, 20, 1);
SvfLp.ar(WhiteNoise.ar() * 0.1, 400, q)
