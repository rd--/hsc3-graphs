{- Forest sounds (Pj) -}
{
	let n1 = BrownNoise();
	let n2 = LfNoise2(50);
	let o = SinOsc(n2 * 50 + 50, 0) * 100 + 2000;
	Bpf(n1, o, 0.001) * 10
} ! 2
