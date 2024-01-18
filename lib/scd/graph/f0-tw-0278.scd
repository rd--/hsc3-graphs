// https://sccode.org/1-4Qy ; f0 ; 0278
var b = 1 / 2 ** (2 .. 6);
var o = LFSaw.ar(LFSaw.ar(b, 0) > 0 * 3 + 15 / b, 0);
var f = pi ** LFSaw.ar(LFSaw.ar(b, 0) + 1 * b) * 999 + (LFSaw.ar(LFSaw.ar(b * 9, 0) * 9, 0) * 99) / 2;
Splay.ar(RLPF.ar(o, f, 0.2)) / 5

// ---- tweet0278
a=LFSaw;Splay ar:RLPF.ar(a.ar(a.ar(b=1/2**(2..6))>0*3+15/b),pi**a.ar(a.ar(b)+1*b)*999+(a.ar(a.ar(b*9)*9)*99)/2,0.2)/5
