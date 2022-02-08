// Slew ; square to triangle ; triangle to sin-like ; https://scsynth.org/t/5208/2 (sp)
var freq = 440;
var square = LFPulse.ar(freq, 0, 0.5) * 2 - 1;
var tri = Slew.ar(square, freq * 4, freq * 4);
var sin = LinLin.ar(tri > 0, 0, 1, -1, 1) * (tri.abs ** (1 / 4));
XFade2.ar(tri, sin, MouseX.kr(-1, 1, 0, 0.2), 0.05)
