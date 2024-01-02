(* DustRange ; sine sweeps *)
{
	var tr = DustRange(0.5, 1.25);
	var dur = TRand(0.01, 0.5, tr);
	var f0 = TRand(48, 60, tr);
	var f1 = TRand(36, 84, tr);
	var freq = TLine(f0, f1, dur, tr).MidiCps;
	var env = Decay2(tr, dur / 3, dur) * 0.5;
	SinOsc(freq, 0) * env
} !^ 7