(********** Reverberated noise bursts ; Jmcc **********)
let s = Decay(Dust(0.6) * 0.2, 0.15) * PinkNoise(); (* pink noise percussion sound *)
let z = DelayN(s, 0.048, 0.048); (* reverb predelay time *)
let y = Sum(CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15)); (* 6 modulated comb delays in parallel *)
4.timesRepeat { (* chain of 4 allpass delays on each of two channels (8 total) *)
	y := AllpassN(y, 0.050, [0.05.Rand0, 0.05.Rand0], 1)
};
s + y (* add original sound to reverb and play it *)
