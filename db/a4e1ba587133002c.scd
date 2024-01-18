// https://sccode.org/1-4Qy ; f0 ; 0324
var c = [1, 3, 5, 6];
var f = Duty.ar(c + 1 / 16, 0, Dseq.dr(LFTri.ar(1 / c / 8) > 0 * 3 + c * 99, inf));
Splay.ar(HPF.ar(BLowPass.ar(LFTri.ar(c, 0), f, 0.001) / 12, 9).sin)
