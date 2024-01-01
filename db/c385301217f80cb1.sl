var theta = MouseX(0.2 * pi, pi, 0, 0.2);
var rho = MouseY(0.6, 0.99, 0, 0.2);
var b1 = 2 * rho * theta.Cos;
var b2 = rho.Squared.Neg;
Sos(LfSaw(200, 0) * 0.1, 1, 0, 0, b1, b2)
