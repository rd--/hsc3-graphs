// Vibrato
x = MouseX.kr(2, 100, 0, 0.2);
y = MouseY.kr(0, 1, 0, 0.2);
v = Vibrato.ar(DC.ar(400), x, 0.1, 1, 1, y, 0.1, 0, 0);
SinOsc.ar(v, 0) * 0.1
