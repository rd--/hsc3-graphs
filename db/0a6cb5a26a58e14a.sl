/* http://twitter.com/tadklimp/status/744132946001559552 (tc) */
let n = 20:70.atRandom;
let d = Lag(LinExp(Dust([n, n] ^ 3), 0, 1, 1, 10), 0.4);
let p = Pulse(
	{ { Rand(0.2, n) } ! 2 } ! n * d,
	{ Rand(0, pi) } ! n
) * n.reciprocal;
p.Sum
