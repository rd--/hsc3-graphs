let rate = MouseX(1, 200, 1, 0.2);
let trig = Impulse(rate, 0);
let sr = SampleRate();
let x = Phasor(trig, rate / sr, 0, 1, [0, MouseY(0, 1, 0, 0.2)]);
SinOsc(x * 500 + 500, 0) * 0.2
