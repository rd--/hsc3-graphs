// https://sccode.org/1-4Qy ; f0 ; 0349
var c = { Dseq.dr([5, 1, 3, 2], inf) };
var e = 1 / [8, 4];
var f = Duty.ar(e, 0, c.value * Duty.ar(e / 4, 0, c.value, 0)) * Duty.ar(1 / e, 0, c.value * 28.8, 0);
SinOsc.ar(f, 0) * SinOsc.ar(e / 9, 0)

//--tweet0349
a=SinOsc;b=Duty;c={Dseq([5,1,3,2],1/0)};a.ar(b.ar(e=1/[8,4],0,c.()*b.ar(e/4,0,c.()))*b.ar(1/e,0,c.()*28.8))*a.ar(e/9)
