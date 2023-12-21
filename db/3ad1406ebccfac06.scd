// DurationCycle
var x = DurationCycle.ar([5, 2, 3] / 5);
SinOsc.ar(x * 1000 + 200, 0) * 0.1 * x
