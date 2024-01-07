let x = PinkNoise() * 0.2;
let y = LfTri(800, 0) * LfPulse(3, 0, 0.3) * 0.2;
Rotate2(x, y, LfSaw(0.1, 0))
