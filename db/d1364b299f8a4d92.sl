{- https://scsynth.org/t/5296 ; tm881 ; rd edit -}
{
	let f = { Rand(33, 2000) } ! 2 * TRand(0.125, 4, Impulse(1 / 10, 0));
	let t = Impulse(1 / 2 * TRand(0.125, 4, Impulse(1 / 5, 0)), 0);
	let a = Perc(t, 0.01, 1, -4);
	FreeVerb(Saw(f) * a, 0.33, 0.5, 0.5)
} !> 16 * 0.1
