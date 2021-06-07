// sweep verb
{
	var s, z, y;
	s = SoundIn.ar([0,1], 0.01) ;
		// reverb predelay time :
	z = DelayN.ar(Mix.ar(s), 0.048);
		// 6 modulated comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));
		// chain of 4 allpass delays on each of two channels (8 total) :
	4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
	// eliminate DC
	LeakDC.ar(y)
}
