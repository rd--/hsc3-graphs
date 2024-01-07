let n = MouseX(1, 9, 0, 0.2).RoundTo(1);
{
	let freq = NRand(200, 10000, n);
	let dur = (1 / freq) * 7500;
	FSinOsc(freq, 0) * Line(0.2, 0, dur)
} !^ 15
