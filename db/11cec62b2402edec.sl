{- DustRange ; sine sweeps -}
{
	let tr = DustRange(0.5, 1.25);
	let dur = TRand(0.01, 0.5, tr);
	let f0 = TRand(48, 60, tr);
	let f1 = TRand(36, 84, tr);
	let freq = TLine(f0, f1, dur, tr).MidiCps;
	let env = Decay2(tr, dur / 3, dur) * 0.5;
	SinOsc(freq, 0) * env
} !^ 7
