// Summer
var trig = Dust.kr(5);
var reset = Impulse.kr(0.5);
SinOsc.ar(Summer.kr(trig, [0.5, 0.25], reset, 1) * 100, 0) * 0.1
