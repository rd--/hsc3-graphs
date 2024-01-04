// DustRange ; sine sweeps
{
	var tr = DustRange.ar(0.5, 1.25);
	var dur = TRand.ar(0.01, 0.5, tr);
	var f0 = TRand.ar(48, 60, tr);
	var f1 = TRand.ar(36, 84, tr);
	var freq = TLine.ar(f0, f1, dur, tr).midiCps;
	var env = Decay2.ar(tr, 0.01, dur);
	SinOsc.ar(freq, 0) * env
} ! 2 * 0.5
