// https://twitter.com/redFrik/status/1562193233001623552 ; f0
var c = SinOscFB.ar(1 / 64, 0).round * 10 + 50;
var f = {
	arg i;
	var p = SinOscFB.ar(
		(i + 1 * c) + (SinOscFB.ar(2.02, 1) * 2),
		SinOscFB.ar(i + 1 / 24, 1) + 1 / 2
	) * SinOscFB.ar(i + 1 / 16, 1);
	var q = SinOscFB.ar(
		i + 1 * 50.05 ** SinOscFB.ar(6, 1),
		1
	) * SinOscFB.ar(i + 1 / 36, 1);
	p % q
};
var p = SinOscFB.ar((SinOscFB.ar(1.to(5), 1) * 3).round + 5 * c, 1) * SinOscFB.ar(12, 1).max(1) * 3;
var q = SinOscFB.ar(c, 0.7) * (SinOscFB.ar(3, 1).min(0) / 3);
0.to(11).collect(f).mean.tanh + Splay2.ar(p.tanh / 9) + q

//---- https://twitter.com/redFrik/status/1562193233001623552 ; f0
var c = SinOscFB.ar(1 / 64, 0).round * 10 + 50;
var f = {
	arg i;
	var f1 = (i + 1 * c) + (SinOscFB.ar(2.02, 1) * 2);
	var r1 = SinOscFB.ar(i + 1 / 24, 1) + 1 / 2;
	var m1 = SinOscFB.ar(i + 1 / 16, 1);
	var f2 = i + 1 * 50.05 ** SinOscFB.ar(6, 1);
	var r2 = 1;
	var m2 = SinOscFB.ar(i + 1 / 36, 1);
	(SinOscFB.ar(f1, r1) * m1) % (SinOscFB.ar(f2, r2) * m2)
};
var p = Splay2.ar((SinOscFB.ar((SinOscFB.ar(1.to(5), 1) * 3).round + 5 * c, 1) * SinOscFB.ar(12, 1).max(1) * 3).tanh / 9);
var q = SinOscFB.ar(c, 0.7) * (SinOscFB.ar(3, 1).min(0) / 3);
0.to(11).collect(f).mean.tanh + p + q

//---- https://twitter.com/redFrik/status/1562193233001623552 ; f0
var c = SinOscFB.ar(1 / 64, 0).round * 10 + 50;
var f = {
	arg i;
	SinOscFB.ar(
		(i + 1 * c) + SinOscFB.ar(2.02, 1, mul: 2),
		SinOscFB.ar(i + 1 / 24, 1) + 1 / 2,
		mul: SinOscFB.ar(i + 1 / 16, 1)
	) % SinOscFB.ar(i + 1 * 50.05 ** SinOscFB.ar(6, 1), 1, mul: SinOscFB.ar(i + 1 / 36, 1))
};
var p = Splay.ar(SinOscFB.ar(SinOscFB.ar(1.to(5), 1, mul: 3).round + 5 * c, 1, mul: SinOscFB.ar(12, 1).max(1) * 3).tanh / 9);
var q = SinOscFB.ar(c, 0.7, mul: SinOscFB.ar(3, 1).min(0) / 3);
mean(f.dup(12)).tanh + p + q

//---- https://twitter.com/redFrik/status/1562193233001623552
play{mean({|i|ar(a=SinOscFB,(i+1*c=ar(a,1/64).round*10+50)+ar(a,2.02,1,2),ar(a,i+1/24,1)+1/2,ar(a,i+1/16,1))%ar(a,i+1*50.05**ar(a,6,1),1,ar(a,i+1/36,1))}!12).tanh+ar(Splay,ar(a,ar(a,(1..5),1,3).round+5*c,1,ar(a,12,1).max*3).tanh/9)+ar(a,c,0.7,ar(a,3,1).min(0)/3)}
