var x = MouseX(220, 660, 0, 0.1);
var y = MouseY(0.01, 0.1, 0, 0.1);
var z = SinOsc(x, 0) * y;
var f = Pitch(z, 440, 60, 4000, 100, 16, 7, 0.02, 0.5, 1, 0);
[z, SinOsc(f.first / 2, 0) * 0.1]
