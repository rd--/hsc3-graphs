let k = MouseX(0.5, 100, 1, 0.2);
let d = MouseY(0.0001, 0.01, 1, 0.2);
let t = Dust(2);
let m0 = Spring(ToggleFf(t), 1 * k, 0.01);
let m1 = Spring(m0, 0.5 * k, d);
let m2 = Spring(m0, 0.6 * k, d);
let m3 = Spring([m1, m2], 0.4 * k, d);
let m4 = Spring(m3 - m1 + m2, 0.1 * k, d);
CombL(t, 0.1, LinLin(m4, -10, 10, 1 / 8000, 1 / 100), 12)
