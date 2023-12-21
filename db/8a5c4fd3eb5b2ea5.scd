// DurationPhasor
var x = DurationPhasor.ar([5, 2, 3] / 5);
SinOsc.ar(x + 1 * 900 + 300, 0) * 0.1 * x
