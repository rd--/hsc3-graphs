// reverberated noise bursts ; jmcc
// pink noise percussion sound :
var s = Decay.ar(Dust.ar(0.6, 0.2), 0.15, PinkNoise.ar);
// reverb predelay time :
var z = DelayN.ar(s, 0.048);
// 6 modulated comb delays in parallel :
var y = Mix.ar(CombL.ar(z, 0.1, LFNoise1.kr(Array.fill(6,{0.1.rand}), 0.04, 0.05), 15));
// chain of 4 allpass delays on each of two channels (8 total) :
4.do({ y = AllpassN.ar(y, 0.050, [0.050.rand,0.050.rand], 1) });
// add original sound to reverb and play it :
s+y
