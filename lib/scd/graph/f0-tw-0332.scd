// https://sccode.org/1-4Qy ; f0 ; 0332
var f = 2 ** (SinOscFB.ar([4, 3], 0) > 0) * (SinOscFB.ar(1 / 16, 0) > 0 + 2 * (SinOscFB.ar(1 / [32, 48]) > 0 * 20 + 99));
var o = SinOscFB.ar(f, SinOscFB.ar(1 / 63.9, 0) + 2 / 3);
AllpassN.ar(o, 3, 3, 60) / 3

//----tweet0332
a=SinOscFB;AllpassN.ar(a.ar(2**(a.ar([4,3])>0)*(a.ar(1/16)>0+2*(a.ar(1/[32,48])>0*20+99)),a.ar(1/63.9)+2/3),3,3,60)/3
