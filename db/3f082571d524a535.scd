// https://sccode.org/1-4Qy ; f0 ; 0341
var e = LFTri.ar(2 ** LFTri.ar(1 / 5, 0), 0).roundTo(LFTri.ar(1 / 8, 0) / 3);
var o = SinOsc.ar(e ** [99, 150], BPF.ar(e % 1, 500, 1)) / 6;
GVerb.ar(HPF.ar(o, 9), 99, 5, 0.1, 0.5, 15, 1, 0.7, 0.5, 300).sum
