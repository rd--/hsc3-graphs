{- Shimmering harmonics -}
let harmonics = 16;
{
	let amp = SinOsc(1 / Rand(3, 6), 0) * Rand(0.1, 0.9);
	Pan2(SinOsc(ExpRand(100, 2000), 0), 1.Rand2, amp)
} !+ harmonics / (2 * harmonics)
