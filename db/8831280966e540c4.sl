let a = Line(-1, 1, 2);
let b = a.Abs;
SinOsc([a, b] * 220 + [220, 440], 0) * [a, b] * 0.1
