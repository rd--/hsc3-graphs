var tr = Impulse(1, 0);
var env = EnvTrapezoid(tr, 0.5, 0, 0.5);
SinOsc(440, 0) * env * 0.1
