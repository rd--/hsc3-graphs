let trig = Impulse(6, 0).kr;
let w3 = SinOsc(1 / 5, 0).kr * 0.5 + 0.5;
let index = TwIndex(
	trig,
	1,
	[0.05, 0.25, w3]
);
[
	SinOsc(Select(index, [333 444 555]), 0),
	SinOsc(w3.LinLin(0, 1, 444, 555), 0) / 3
] * 0.1
