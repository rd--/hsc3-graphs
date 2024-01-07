let x = { LfSaw(200 + Rand(-2, 2), 0) * 0.1 } !+ 4;
let y = SinOsc(900, 0) * LfPulse(3, 0, 0.3) * 0.2;
Rotate2(x, y, MouseX(0, 2, 0, 0.2))
