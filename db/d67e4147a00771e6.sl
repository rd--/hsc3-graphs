{ :tr |
	var table = [0 2 4 5 7 9 11 12];
	var octave = Choose(tr, [0 .. 2]);
	var note = 48 + Choose(tr, table);
	var freq = (octave * 12 + note).MidiCps;
	var detune = 1.5;
	var osc = SinOsc(freq, 0) * 0.1;
	var left = osc + FreqShift(osc, freq * detune, 0);
	var right = FreqShift(left, SinOsc(3.23, 0) * 5, 0);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
