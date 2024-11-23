/* DynRingzBank */
let tr = Dust(25);
let mkRand = { :lhs :rhs |
	Lag(TRand(lhs, rhs, tr), 0.01)
};
let k = DynRingzBank(
	Trig(tr, SampleDur()),
	1:5 * 2700,
	{ mkRand(0.025, 0.04) } ! 5,
	[0.1]
);
let n = k + (BrownNoise() * 0.075 * Trig(tr, mkRand(0.01, 0.03)));
let f = Lpf(Hpf(n, mkRand(6000, 750)), mkRand(4000, 5500));
EqPan(f, mkRand(-1, 1))
