(* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft *)
let o = { :freq :lo :hi |
	SinOsc(freq, 0).Range(lo, hi)
};
SinOsc(
	o(
		o(3, 4, 20),
		o(0.75, 50, 70),
		o(0.5, 100, 200 + [11, 22])
	),
	0
) / 5
