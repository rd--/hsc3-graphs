{- This one floats in and out -}
let totalPartials = 3;
{
	let base = ExpRand(50, 100);
	let freq = { Rand(1, 24) * base * Rand(1, 1.1) } ! totalPartials;
	let amp = { Rand(0.1, 0.5) } ! 10;
	let res = RingzBank(GrayNoise() * Rand(0.03, 0.1), freq, amp, [1]);
	Pan2(res, LfNoise1(1), (SinOsc(10 / Rand(1, 5), 0) * 0.005).Max(0))
} !> 8 * LfNoise1(1 / 10).Abs
