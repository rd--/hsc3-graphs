(* SfRead ; phasor as phase input ; harp *)
var sf = SfAcquireStereo('harp-a4');
{
	var tr = Impulse(2 ^ Rand(1, 3) / (SfDur(sf) * 4), 0).kr;
	var mnn = TiRand(-2, 0, tr) * 12 + Choose(tr, [0, 2.1, 4.9, 7, 9.2]);
	var rt = mnn.MidiRatio * SfRateScale(sf);
	var ph = Phasor(tr, rt, 0, SfFrames(sf), 0);
	SfRead(sf, ph, 0, 2)
} !> 6 / 9
