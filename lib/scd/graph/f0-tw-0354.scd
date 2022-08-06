// https://sccode.org/1-4Qy ; f0 ; tweet0354
var b = [1, 9 / 8];
var d = LFTri.ar(b / 8, 0);
var c = RingzBank.ar(LFTri.ar(5 * b, 0), [12, 4, 3, 9, 10] * 2 * 99 * b, [1], [1]) * d;
LFTri.ar(b * 2, 0).sum < 0 * SinOscFB.ar(b * 99, d + 1 / 2) + c / 2

//----tweet0354
a=LFTri;c=Klank.ar(`[[12,4,3,9,10]*2*99],a.ar(5*b=[1,9/8]),b)*d=a.ar(b/8);a.ar(b*2).sum<0*SinOscFB.ar(b*99,d+1/2)+c/2
