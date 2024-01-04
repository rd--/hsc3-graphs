(* Reverberated noise bursts ; Jmcc *)
(* pink noise percussion sound *)
let s = Decay(Dust(0.6) * 0.2, 0.15) * PinkNoise();
(* reverb predelay time *)
let z = DelayN(s, 0.048, 0.048);
(* 6 modulated comb delays in parallel *)
let y = Sum(CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15));
(* chain of 4 allpass delays on each of two channels (8 total) *)
4.timesRepeat {
	y := AllpassN(y, 0.050, [0.05.Rand0, 0.05.Rand0], 1)
};
(* add original sound to reverb and play it *)
s + y
