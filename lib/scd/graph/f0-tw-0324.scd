// https://sccode.org/1-4Qy ; f0 ; 0324
var c = [1, 3, 5, 6];
var f = Duty.ar(c + 1 / 16, 0, Dseq(LFTri.ar(1 / c / 8) > 0 * 3 + c * 99, inf));
Splay.ar(HPF.ar(BLowPass.ar(LFTri.ar(c, 0), f, 0.001) / 12, 9).sin)

//----tweet0324
Splay ar:HPF.ar(BLowPass.ar(LFTri ar:c=[1,3,5,6],Duty.ar(c+1/16,0,Dseq(LFTri.ar(1/c/8)>0*3+c*99,inf)),1e-3)/12,9).sin
