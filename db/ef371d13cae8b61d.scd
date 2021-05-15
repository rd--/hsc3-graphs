// modal space ; mouse x controls discrete pitch in dorian mode ; jmcc
{
	var mix;
	mix =
	// lead tone
	SinOsc.ar(
		(DegreeToKey.kr(
			LocalBuf.newFrom([0,2,3,5,7,9,10]),
			MouseX.kr(0,15),	// mouse indexes into scale
			12)				// 12 notes per octave
			+ 72
		    + LFNoise1.kr(3, [0.04,0.04])).midicps,
		0,
		0.1)
	// drone 5ths
	+ RLPF.ar(LFPulse.ar([48,55].midicps, 0, 0.15),
		SinOsc.kr(0.1, 0, 10, 72).midicps, 0.1, 0.1);
	CombN.ar(mix, 0.31, 0.31, 2, 1, mix)
}
