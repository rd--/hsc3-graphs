(* Sweep verb ; Jmcc *)
let s = AudioIn([1, 2]) * 0.01;
(* reverb predelay time *)
let z = DelayN(s.Sum, 0.048, 0.048);
(* 6 modulated comb delays in parallel *)
let y = CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15).Sum;
(* chain of 4 allpass delays on each of two channels (8 total) *)
4.timesRepeat {
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
(* eliminate DC *)
LeakDc(y, 0.995)
