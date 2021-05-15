// reverberated sine percussion jmc
{
    var d = 10; // number of percolators
    var c = 7; // number of comb delays
    var a = 4; // number of allpass delays
		// sine percolation sound :
	var s = Mix.ar(Array.fill(d, { Resonz.ar(Dust.ar(2/d, 50), 200 + 3000.0.rand, 0.003)}) );
		// reverb predelay time :
	var z = DelayN.ar(s, 0.048);
		// 7 length modulated comb delays in parallel :
	var y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(c,{0.1.rand}), 0.04, 0.05), 15));
		// chain of 4 allpass delays on each of two channels (8 total) :
	a.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
		// add original sound to reverb and play it :
	s+(0.2*y)
}
