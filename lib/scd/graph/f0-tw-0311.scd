// https://sccode.org/1-4Qy ; f0 ; 0311
var f = SinOscFB.ar(8, 0) + 3 << (SinOscFB.ar(3 / 8, 0.9) * (SinOscFB.ar(5, 0) + 1) + 4.2) * 9;
var o = SinOscFB.ar(f, SinOscFB.ar(1 / 32, 0) + SinOscFB.ar(7.9, 1));
AllpassC.ar(o, 2, SinOscFB.ar([3, 2] / 999) + 1, 4) / 2

// ---- tweet0311
a=SinOscFB;AllpassC.ar(a.ar(a.ar(8)+3<<a.ar(3/8,0.9,a.ar(5)+1,4.2)*9,a.ar(1/32)+a.ar(7.9,1)),2,a.ar([3,2]/999)+1,4)/2
