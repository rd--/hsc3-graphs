var b = SfAcquire('crotale-d6', 1, [1]);
var rate = MouseX(0.1, 100, 1, 0.2);
var trig = Impulse(rate, 0);
var bFrames = SfFrames(b);
var resetPos = [0, MouseY(0, bFrames, 0, 0.2)];
var x = Phasor(trig, SfRateScale(b), 0, bFrames, resetPos);
SfRead(b, x, 1, 2)
