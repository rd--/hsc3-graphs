let x = MouseX(220, 660, 0, 0.1);
let y = MouseY(0.01, 0.1, 0, 0.1);
let z = SinOsc(x, 0) * y;
let f = Pitch(z, 440, 60, 4000, 100, 16, 7, 0.02, 0.5, 1, 0);
[z, SinOsc(f.first / 2, 0) * 0.1]
