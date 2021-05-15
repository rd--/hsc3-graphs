// noise burst sweep ; jmcc
{
	var lfoRate, amp, cfreq, filt;
	lfoRate = MouseX.kr(10, 60, 'exponential');
	amp = max(0, LFSaw.kr(lfoRate, -1));
	cfreq = MouseY.kr(400, 8000, 'exponential');
	cfreq = SinOsc.kr(0.2, 0, cfreq, 1.05 * cfreq);
	Resonz.ar(WhiteNoise.ar(amp), cfreq, 0.1);
}
