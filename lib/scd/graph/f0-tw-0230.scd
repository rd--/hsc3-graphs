// https://sccode.org/1-4Qy ; f0 ; 0230
var b = (1 .. 9) / 16;
var e = Ringz.ar(LFSaw.ar(b, 0), b * 999, 1.25);
var d = 1 / ( b * 999) * (LFTri.ar(b / 120, b * 2) % 1);
Splay.ar(CombC.ar(PinkNoise.ar * e, 1, d, 3)) / 99

// ---- tweet0230
Splay.ar(CombC.ar(PinkNoise.ar(Ringz.ar(LFSaw.ar(b=(1..9)/16),b*999,1.25)),1,1/(b*999)*(LFTri.ar(b/120,b*2)%1),3))/99
