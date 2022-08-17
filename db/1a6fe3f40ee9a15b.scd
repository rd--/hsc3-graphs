// https://sccode.org/1-4Qy ; f0 ; 0301
var b = {
	arg i;
	Duty.kr(i + 1 / 9, 0, In.kr(i + 1 % 4, 1) + Dseq(8.fib, inf) % 9)
}.dup(4);
Out.kr(0, b);
Splay2.ar(CombN.ar(SinOsc.ar(b * 99, b * 2), 1, 1 / 3, 1) / 2)
