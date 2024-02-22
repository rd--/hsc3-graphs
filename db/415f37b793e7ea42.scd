// https://sccode.org/1-4Qy ; f0 ; 0233
var b = 1 / [1, 4, 6, 8, 11];
var c = LFTri.kr(b / 98, 0);
var q = Dseq(Select.kr(LFTri.kr(b / 99, 0) + c * 5, 1 / b + 59), inf).midicps;
Splay.ar(LFTri.ar(Duty.ar(b, c, q) + c, 0) / 2)
