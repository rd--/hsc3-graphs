{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let in = FreqShift(
		InFb(1, 0) * 3.2,
		TxLine(0.01, freq * 1.5, 1, tr),
		0
	);
	let osc = SinOsc(freq, 0) * Sine(tr, 9) * 0.1;
	let snd = FreqShift(
		osc + in,
		SinOsc(4.24, 0.5) * 3,
		0
	) * 0.5;
	(osc + snd) / 3 # 2
}.OverlapTexture(3, 3, 3).Mix
