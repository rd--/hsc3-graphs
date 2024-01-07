{
	let freq = Rand(200, 800);
	let dur = (1 / freq) * 7500;
	SinOsc(freq, 0) * Line(0.2, 0, 1)
} !^ 5
