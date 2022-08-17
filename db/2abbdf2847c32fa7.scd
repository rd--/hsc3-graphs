// https://sccode.org/1-4Qy ; f0 ; 0355
var b = 1.to(9);
var o = LFSaw.ar(LFSaw.ar(9, 2 / b)) > 0.05 * GrayNoise.ar() * 999 * LFSaw.ar(440, 0);
Splay2.ar(MoogFF.ar(o, 2 ** LFSaw.ar(b / 3.55, 0).round * b * 99, 3.5, 0)).tanh
