/* Slew ; square to triangle ; triangle to sin-like ; https://scsynth.org/t/5208/2 (sp) */
let freq = 440;
let square = LfPulse(freq, 0, 0.5) * 2 - 1;
let tri = Slew(square, freq * 4, freq * 4);
let sin = LinLin(tri > 0, 0, 1, -1, 1) * (tri.Abs ^ (1 / 4));
XFade2(tri, sin, MouseX(-1, 1, 0, 0.2), 0.05)
