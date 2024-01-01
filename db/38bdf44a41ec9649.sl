var rate = MouseX(1, 200, 1, 0.2);
var trig = Impulse(rate, 0);
var sr = SampleRate();
var x = Phasor(trig, rate / sr, 0, 1, [0, MouseY(0, 1, 0, 0.2)]);
SinOsc(x * 500 + 500, 0) * 0.2
