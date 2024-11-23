/* Quad ; eye ; Jmcc */
let m = MouseX(0.5, 1, 0, 0.2);
let a = LfPulse(200, 0, 0.3) * 0.05;
let b = OnePole(a, m);
let c = OnePole(b, m);
let d = OnePole(c, m);
let e = OnePole(d, m);
[b, c, d, e]
