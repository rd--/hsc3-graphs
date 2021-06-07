// monastic resonance ; mouse controls size and reverb time
{
	var s, z, y, decayTime, delayScale;
	decayTime = MouseX.kr(0,16);
	delayScale = MouseY.kr(0.01, 1);
	s = SoundIn.ar([0,1], 0.005) ;
		// reverb predelay time :
	z = DelayN.ar(Mix.ar(s), 0.048);
		// 8 comb delays in parallel :
	y = Mix.ar(CombL.ar(z, 0.1, Array.fill(8,{0.04.rand2 + 0.05}) * delayScale, decayTime));
		// chain of 5 allpass delays on each of two channels (10 total) :
	5.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
	// eliminate DC
	LeakDC.ar(y)
}
