let x = 10;
let y = LfSaw(1 / 6, 0) * 100;
let distance = Hypot(x, y);
let velocity = Slope(distance);
let pitchRatio = (344 - velocity) / 344;
let amplitude = 10 / distance.Squared;
SinOsc(1000 * pitchRatio, 0) * amplitude
