// https://sccode.org/1-4Qy ; f0 ; 0341
var e = LFTri.ar(2 ** LFTri.ar(1 / 5, 0), 0).round(LFTri.ar(1 / 8, 0) / 3);
var o = SinOsc.ar(e ** [99, 150], BPF.ar(e % 1, 500, 1)) / 6;
GVerb.ar(HPF.ar(o, 9), 99, 5, 0.1, 0.5, 15, 1, 0.7, 0.5, 300).sum

// ---- tweet0341
a=LFTri;e=a.ar(2**a.ar(1/5)).round(a.ar(1/8)/3);GVerb.ar(HPF.ar(SinOsc.ar(e**[99,150],BPF.ar(e%1,500))/6,9),99,5,0.1)
