/* QuadC ; logistic map ; equation: x1 = -r * x0 ^ 2 + r * x0 */
let r = MouseX(3.5441, 4, 0, 0.2);
QuadC(SampleRate() / 4, r.Neg, r, 0, 0.1) * 0.4
