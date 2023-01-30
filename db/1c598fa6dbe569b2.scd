// CurveGen
var env = CurveGen.kr(1, [2, 1, 0.5], [0.5, 1], [-4, 4]);
SinOsc.ar(440 * env, 0) * 0.1
