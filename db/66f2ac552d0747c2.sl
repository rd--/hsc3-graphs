var n = 5;
var m = 64;
var a = {
	var x = { Rand(-0.2, 0.2) } ! m;
	x := x ++ ({ Drand(1, { Rand(-0.2, 0.2) } ! n) } ! m.atRandom);
	Dseq(inf, x.scramble)
} ! n;
DmdFor(
	MouseX(1, 125, 1, 0.2) * SampleDur() * [1, 1.02],
	0,
	Dswitch1(a, MouseY(0, n - 1, 0, 0.2))
)
