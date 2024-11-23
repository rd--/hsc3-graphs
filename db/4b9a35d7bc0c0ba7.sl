/* SinOscFb */
let y = MouseY(1, 1000, 1, 0.2);
let x = MouseX(0.5 * pi, pi, 0, 0.2);
SinOscFb(100 * SinOscFb(y, 0) + 200, x) * 0.1
