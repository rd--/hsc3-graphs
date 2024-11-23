/* SfRead ; phasor as phase input ; harp */
let sf = SfAcquireStereo('HarpA4');
{
	let tr = Impulse(2 ^ Rand(1, 3) / (SfDur(sf) * 4), 0).kr;
	let mnn = TiRand(-2, 0, tr) * 12 + Choose(tr, [0, 2.1, 4.9, 7, 9.2]);
	let rt = mnn.MidiRatio * SfRateScale(sf);
	let ph = Phasor(tr, rt, 0, SfFrames(sf), 0);
	SfRead(sf, ph, 0, 2)
} !> 6 / 9
