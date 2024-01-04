/* EnvTrapezoid ; control rate ; default parameters */
var tr = Impulse.kr(4, 0);
var env = EnvTrapezoid.kr(tr, 0.5, 0, 0.5);
SinOsc.ar(440, 0) * env * 0.1
