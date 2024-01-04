var freq = LfNoise2(1).Range(111, 555);
var latchFreq = Duty(MouseX(0.1, 1, 1, 0.2), 0, freq);
SinOsc([freq, latchFreq], 0) * 0.1
