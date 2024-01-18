// https://sccode.org/1-4Qy ; f0 ; 0355
var b = (1 .. 9);
var o = LFSaw.ar(LFSaw.ar(9, 2 / b)) > 0.05 * GrayNoise.ar * 999 * LFSaw.ar(440, 0);
Splay.ar(MoogFF.ar(o, 2 ** LFSaw.ar(b / 3.55, 0).round * b * 99, 3.5, 0)).tanh

//----tweet0355
a=LFSaw;Splay.ar(MoogFF.ar(a.ar(a.ar(9,2/b=(1..9)))>0.05*GrayNoise.ar(999)*a.ar,2**a.ar(b/3.55).round*b*99,3.5)).tanh
