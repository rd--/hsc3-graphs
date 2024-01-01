{ :tr |
	var table = [0 2 4 5 7 9 11 12];
	var octave = Choose(tr, [0 .. 2]);
	var note = 48 + Choose(tr, table);
	var freq = (octave * 12 + note).MidiCps;
	var width = SinOsc(2.3, 0).LinLin(-1, 1, 0.2, 0.8);
	var osc = Pulse(freq, width) * 0.1;
	var left = FreqShift(osc, XLine(-0.1, -200, 3), 0);
	var right = FreqShift(osc, XLine(0.1, 200, 3), 0);
	[left, right] / 3
}.OverlapTexture(3, 3, 3).Mix
