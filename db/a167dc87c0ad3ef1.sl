/* QuadC ; logistic map as frequency control */
let r = MouseX(3.5441, 4, 0, 0.2);
SinOsc(QuadC(40, r.Neg, r, 0, 0.1) * 800 + 900, 0) * 0.4
