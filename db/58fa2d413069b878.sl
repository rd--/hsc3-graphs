(* https://github.com/redFrik/udk08-Soft_and_Hard/tree/master/130117soft *)
MoogFf(
	{ WhiteNoise() } ! 2 / 5,
	MouseX(100, 10000, 1, 0.2),
	LfNoise2(1).LinLin(0, 1, 2, 3.8),
	0
)
