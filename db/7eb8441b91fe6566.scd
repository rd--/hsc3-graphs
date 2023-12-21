/* EnvTrapezoid ; audio rate ; default parameters ; keywords */
var tr = Impulse.ar(freq: 1, phase: 0);
var env = EnvTrapezoid.ar(trig: tr, dur: 0.5, shape: 0, skew: 0.5);
SinOsc.ar(freq: 440, phase: 0) * env * 0.1
