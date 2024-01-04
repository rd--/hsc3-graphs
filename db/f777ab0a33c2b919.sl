var n = 5;
var m = 64;
var a = {
	var x = [
		{ randomFloat(-0.2, 0.2) } ! m,
		{ Drand(1, { randomFloat(-0.2, 0.2) } ! n) } ! m.atRandom
	].concatenation;
	Dseq(inf, x.scramble)
} ! n;
Duty(
	MouseX(1, 125, 1, 0.2) * SampleDur() * [1, 1.02],
	0,
	Dswitch1(MouseY(0, n - 1, 0, 0.2), a)
)
