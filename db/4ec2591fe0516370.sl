{- Random bells, let it run for a while -}
let k = 12;
let tr = Dust(3 / 7);
{
	SinOsc(Rand(50, 4000), 0) * Decay2(tr, 0.01, Rand(0.2, 3)) * Rand(0.1, 1)
} !^ k / k
