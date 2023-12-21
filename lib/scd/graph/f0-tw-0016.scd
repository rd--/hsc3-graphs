// https://sccode.org/1-4Qy ; f0 ; 0016
var b = LocalBuf(90000, 2).clear;
var i = Sweep.ar(BufRd.ar(2, b, Saw.ar(12) * 30000 + 40000), 90000, 1, 2);
var w = BufWr.ar(Saw.ar([8, 9]), b, i, 1);
(BufRd.ar(2, b, i, 1, 2) / 2 <! w).flop.sum

// ---- tweet0016
b=LocalBuf(9e4,2).clear;i=Sweep.ar(BufRd.ar(2,b,Saw.ar(12,3e4,4e4)),9e4);BufWr.ar(Saw.ar([8,9]),b,i);BufRd.ar(2,b,i)/2
