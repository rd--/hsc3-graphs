// https://sccode.org/1-4Qy ; f0 ; tweet0350
var b = (1 .. 9).reverse / 99;
var o = LFSaw.ar(LFSaw.ar(b, b) + 1 * 99, b) * (LFSaw.ar(LFSaw.ar(b, 0) > b, 0) > 0.9);
Splay.ar(CombN.ar(GVerb.ar(o, 99, 1, b * 9, b, 15, 1, 0.7, 0.5, 300) / 19, 1, b / 9.9, 9) * 0.9)

// ---- tweet0350
a=LFSaw;Splay ar:CombN.ar(GVerb.ar(a.ar(a.ar(b=(9..1)/99,b)+1*99,b,a.ar(a.ar(b)>b)>0.9),99,1,b*9,b)/19,1,b/9.9,9,0.9)
