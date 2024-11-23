let b = SfAcquire('CrotaleD6', 1, [1]);
let rate = MouseX(0.1, 100, 1, 0.2);
let trig = Impulse(rate, 0);
let bFrames = SfFrames(b);
let resetPos = [0, MouseY(0, bFrames, 0, 0.2)];
let x = Phasor(trig, SfRateScale(b), 0, bFrames, resetPos);
SfRead(b, x, 1, 2)
