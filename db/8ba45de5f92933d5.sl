/* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/121220soft */
let p = { :freq :lo :hi |
	LfPulse(freq, 0, 0.5).LinLin(0, 1, lo, hi)
};
p(
	p(
		p(3, 4, 20),
		p(0.75, 50, 70),
		p(0.5, 100, 200)
	),
	-0.1,
	0.1
)
