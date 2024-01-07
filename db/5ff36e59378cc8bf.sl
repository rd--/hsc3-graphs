let scale = [0 2 4 5 7 9 10 12].asLocalBuf;
{
	let degree = IRand(0, 7);
	let octave = IRand(4, 7);
	let pitchClass = Index(scale, degree);
	let mnn = (octave * 12) + pitchClass;
	let numHarm = IRand(1, 4);
	Blip(mnn.MidiCps, numHarm) * 0.1
} !^ 7
