(* 22 Nov. 2021 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var k = 1 / 100000;
var n = {
	1 + ((k * (1 .. 7))).scramble
};
Splay(
	VarSaw(
		33 * n(),
		0,
		LfSaw(1 / 3 * n(), 0) * LfSaw(n() / 3, 0)
	) * (LfSaw(5 / 3, 0) * (LfSaw(7 / 3 * n().Neg, 0).Tan)).Abs
).Tanh
