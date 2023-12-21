// https://sccode.org/1-4Qy ; f0 ; 0233
var b = 1 / [1, 4, 6, 8, 11];
var c = LFTri.kr(b / 98, 0);
var q = Dseq.dr(Select.kr(LFTri.kr(b / 99, 0) + c * 5, 1 / b + 59), inf).midiCps;
Splay2.ar(LFTri.ar(Duty.ar(b, c, q) + c, 0) / 2)

// ---- tweet0233
a=LFTri;Splay.ar(a.ar(Duty.ar(b=1/[1,4,6,8,11],c=a.kr(b/98),Dseq(Select.kr(a.kr(b/99)+c*5,1/b+59),inf).midicps)+c)/2)
