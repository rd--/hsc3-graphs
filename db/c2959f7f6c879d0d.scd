// https://sccode.org/1-4Qy ; f0 ; 0279
var b = [1, 3, 6, 8, 10];
var m = DegreeToKey.ar(b.asLocalBuf, LFSaw.ar(LFSaw.ar(1 / b / 99, 0) / pi, 0) * 12 + 18 + b, 12);
var f = CombN.ar(m.midicps, 0.2, 0.2, 1);
Splay.ar(LFSaw.ar(f, 0)) * 0.6
