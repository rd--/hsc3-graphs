let t = Impulse(8, 0) * (LfSaw(0.25, 0) * -0.6 + 0.7);
let z = Decay2(t, 0.001, 0.3) * FSinOsc(500, 0);
let l = -8.DbAmp;
[z * l, Limiter(z, l, 0.01)]
