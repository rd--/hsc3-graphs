(* Dust ; as envelope ; left-to-right *)
var lfo = { :freq :lo :hi | LfNoise2(freq).Range(lo, hi) };
Dust([3 / 5, 5 / 7])
	.Mul(1 / 4)
	.Decay(lfo(1 / 3, 1 / 5, 5 / 7))
	.Mul(PinkNoise())
	.Bpf(lfo(1 / 3, 700, 2300), lfo(1 / 3, 1 / 9, 3))
	.AllpassN(1 / 5, 1 / 5, lfo(1 / 3, 1 / 3, 3))
