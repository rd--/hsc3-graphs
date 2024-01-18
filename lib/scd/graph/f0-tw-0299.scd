// https://sccode.org/1-4Qy ; f0 ; 0299
var c = 3 ** LFSaw.ar([2, 3], [0, 1]);
var p = Formant.ar(LFSaw.ar(1 / 16, 0).round(c) + 3 * 33 * c.ceil, 3 ** c.lag * 66, 3 ** c * 99);
var q = Formant.ar(c + 3, 1 - c * 3000);
p * q / 4

// ---- tweet0299
a=LFSaw;b=Formant;b.ar(round(a.ar(1/16),c=3**a.ar([2,3],[0,1]))+3*33*ceil(c),3**c.lag*66,3**c*99)*b.ar(c+3,1-c*3e3)/4
