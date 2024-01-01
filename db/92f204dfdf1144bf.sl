var x = MouseX(-9, 9, 0, 0.2);
var step = Stepper(Impulse(10, 0), 0, 4, 16, x, 0);
SinOsc(step * 100, 0) * 0.05
