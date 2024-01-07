{ :tr |
	let table = [0 2 4 5 7 9 11 12];
	let octave = Choose(tr, [0 .. 2]);
	let note = 48 + Choose(tr, table);
	let freq = (octave * 12 + note).MidiCps;
	let detune = 1.5;
	let osc = SinOsc(freq, 0) * 0.1;
	let left = osc + FreqShift(osc, freq * detune, 0);
	let right = FreqShift(left, SinOsc(3.23, 0) * 5, 0);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
