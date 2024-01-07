let a = SinOsc(800, 0);
let b = SinOsc(XLine(200, 500, 5), 0);
let c = a - b;
(c * c) * 0.125
