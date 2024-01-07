let t = Impulse(8, 0) * (LfSaw(0.25, 0) * -0.6 + 0.7);
let z = Decay2(t, 0.001, 0.3) * FSinOsc(500, 0);
Limiter(z, MouseX(0, 1, 0, 0.2), 0.01) * 0.2
