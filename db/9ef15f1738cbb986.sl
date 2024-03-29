{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let width = SinOsc(2.3, 0).LinLin(-1, 1, 0.2, 0.8);
	let osc = Pulse(freq, width) * 0.1;
	let left = FreqShift(osc, XLine(-0.1, -200, 3), 0);
	let right = FreqShift(osc, XLine(0.1, 200, 3), 0);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
