/********** Sweep verb ; Jmcc **********/
let s = AudioIn([1, 2]) * 0.01;
let z = DelayN(s.Sum, 0.048, 0.048); /* reverb predelay time */
let y = CombL(z, 0.1, LfNoise1({ 0.1.Rand0 } ! 6).MulAdd(0.04, 0.05), 15).Sum; /* 6 modulated comb delays in parallel */
4.timesRepeat { /* chain of 4 allpass delays on each of two channels (8 total) */
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
LeakDc(y, 0.995) /* eliminate DC */
