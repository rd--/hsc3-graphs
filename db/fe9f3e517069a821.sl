(* http://sccode.org/1-9 (jl) *)
let n = 956;
let a = Hpf(PinkNoise() * 0.005, 10) * Line(0, 1, 9);
let z = (1 .. 99).collect { :i |
	Ringz(a * LfNoise1(0.05 + Rand(0, 0.1)), 55 * (i + n) + 60, 0.2)
};
GVerb(z.Sum, 70, 990, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).Tanh
