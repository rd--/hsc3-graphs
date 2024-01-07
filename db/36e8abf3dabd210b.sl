let minmax = MouseX(0, 1, 0, 0.2);
{
	let freq = LinRand(200, 10000, minmax);
	let dur = (1 / freq) * 7500;
	FSinOsc(freq, 0) * Line(0.2, 0, dur)
} !^ 15
