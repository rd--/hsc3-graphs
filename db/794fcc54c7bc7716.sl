let inforce = K2A(MouseButton(0, 1, 0)) > 0;
let k = MouseY(0.1, 20, 1, 0.2);
let d = MouseX(0.00001, 0.1, 1, 0.2);
let outforce = Spring(inforce, k, d);
let freq = outforce * 400 + 500;
SinOsc(freq, 0) * 0.2
