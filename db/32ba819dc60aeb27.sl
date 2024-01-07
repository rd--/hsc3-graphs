let theta = MouseX(0.2 * pi, pi, 0, 0.2);
let rho = MouseY(0.6, 0.99, 0, 0.2);
let b1 = 2 * rho * theta.Cos;
let b2 = rho.Squared.Neg;
Sos(LfSaw(200, 0) * 0.1, 1, 0, 0, b1, b2)
