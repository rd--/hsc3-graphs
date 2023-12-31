(* SfRead ; phasor as phase input ; piano *)
var sf = SfAcquireStereo('piano-c5');
{
	var tr = Impulse(2 ^ Rand(1, 2) / SfDur(sf), 0).kr;
	var mnn = TiRand(-2, 0, tr) * 12 + Choose(tr, [-3, 0, 2, 5, 7]);
	var rt = mnn.MidiRatio * SfRateScale(sf);
	var ph = Phasor(tr, rt, 0, SfFrames(sf), 0);
	SfRead(sf, ph, 0, 2)
} !> 6 / 4
