(* CombC *)
{ :tr |
	var chord = [60 63 67; 65 68 72; 55 58 62].atRandom;
	var note = { (chord.atRandom - [0 12 24].atRandom).MidiCps } ! 2;
	var x = Decay(tr, 1 + TRand(0.1, 0.3, tr)) * BrownNoise() * 0.1;
	CombC(x, 0.05, 1 / note, Rand(1, 3))
}.OverlapTexture(4, 1, 9).Mix
