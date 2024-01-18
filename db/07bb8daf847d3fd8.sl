{- TiRand -}
let scale = [0 2 4 5 7 9 10 12].asLocalBuf;
{ :tr |
	{
		let degree = TiRand(0, 7, tr);
		let octave = TiRand(4, 7, tr);
		let pitchClass = Index(scale, degree);
		let mnn = (octave * 12) + pitchClass;
		let numHarm = TiRand(1, 4, tr);
		Blip(mnn.MidiCps, numHarm) * 0.1
	} ! 7
}.OverlapTexture(4, 0.05, 2).Mix
