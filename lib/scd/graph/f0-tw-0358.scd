// https://sccode.org/1-4Qy ; f0 ; 0358
var b = LFTri.ar(2 / [9, 8, 7], 0);
var f = [2, 3, 4, 5] / (LFTri.ar(0.1, 0) > 0 + 2) ** LFTri.ar(b, 0).ceil.lag(0.1) * 99 * [3, 1, 8, 2, 4];
var o = Pulse.ar(Fold.ar(f, 9, 999), 2 - b / 5);
Splay.ar(o) / 2

//----tweet0358
a=LFTri;Splay ar:Pulse.ar(fold((2..5)/(a.ar(0.1)>0+2)**a.ar(b=a.ar(2/(9..7))).ceil.lag*99*[3,1,8,2,4],9,999),2-b/5)/2
