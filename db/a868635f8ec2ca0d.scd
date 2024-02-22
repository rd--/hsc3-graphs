// https://twitter.com/tadklimp/status/744132946001559552
var n= 40.rrand(70);
var d = Lag.kr(Dust.kr(n.pow(3) ! 2).exprange(1, 10), 0.4);
var p = Pulse.ar(
	{ { Rand(0.2, n) } ! 2 } ! n * d,
	{ Rand(0, pi) } ! n
) * n.reciprocal;
p.sum
