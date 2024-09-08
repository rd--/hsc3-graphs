let n = 5;
let m = 64;
let a = {
	let x = [
		{ (-0.2 -- 0.2).atRandom } ! m,
		{ Drand(1, { (-0.2 -- 0.2).atRandom } ! n) } ! m.atRandom
	].++;
	Dseq(inf, x.scramble)
} ! n;
Duty(
	MouseX(1, 125, 1, 0.2) * SampleDur() * [1, 1.02],
	0,
	Dswitch1(MouseY(0, n - 1, 0, 0.2), a)
)
