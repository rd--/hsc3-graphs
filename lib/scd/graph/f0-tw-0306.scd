// https://sccode.org/1-4Qy ; f0 ; 0306
var f = {
	arg i;
	SinOsc.ar(Duty.ar(i + 1 / 9, 0, Dseq(1.to(8).stutter(32), inf) * Dseq(8.fib, inf) * 99), 0)
};
HPF.ar(FreeVerb.ar([0, 1].collect(f), 0.2, 1, 0.2), 9) / 3

// ---- calculations
[1, 2, 3].stutter(3) == [1, 1, 1, 2, 2, 2, 3, 3, 3]

// ---- tweet0306
HPF.ar(FreeVerb.ar({|i|SinOsc.ar(Duty.ar(i+1/9,0,Dseq((1..8).stutter(32),inf)*Dseq(8.fib,inf)*99))}!2,0.2,1,0.2),9)/2
