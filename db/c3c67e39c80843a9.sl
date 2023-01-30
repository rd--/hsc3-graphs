;; IRand
var scale = [0, 2, 4, 5, 7, 9, 10, 12].asLocalBuf;
{
	var degree = IRand(0, 7);
	var octave = IRand(4, 7);
	var pitchClass = Index(scale, degree);
	var mnn = (octave * 12) + pitchClass;
	var numHarm = IRand(1, 4);
	Blip(mnn.MidiCps, numHarm) * 0.1
} !^ 7
