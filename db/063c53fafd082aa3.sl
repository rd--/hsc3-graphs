var x = 10;
var y = LfSaw(1 / 6, 0) * 100;
var distance = Hypot(x, y);
var velocity = Slope(distance);
var pitchRatio = (344 - velocity) / 344;
var amplitude = 10 / distance.Squared;
SinOsc(1000 * pitchRatio, 0) * amplitude
