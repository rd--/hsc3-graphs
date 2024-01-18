// https://sccode.org/1-4Qy ; f0 ; 0310
var b = 1 / [3, 2];
var f = Duty.ar(Trig.ar(LocalIn.ar(2, 0), SinOscFB.ar(b, 0) + 11 / 2), 0, Dseq((1 .. 8), inf)) * 99;
var c = SinOscFB.ar(f, SinOscFB.ar(b / 12, 0));
c <! LocalOut.ar(c)
