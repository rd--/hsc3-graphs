let trig = Impulse(MouseX(0.5, 20, 1, 0.2), 0);
SinOsc(Sweep(trig, 700) + 500, 0) * 0.1
