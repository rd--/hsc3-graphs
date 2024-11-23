/* Sweep verb (Jmcc) #5 ; requires=AudioIn */
let s = AudioIn([1, 2]) * 0.01;
let z = DelayC(s.Sum, 0.048, 0.048); /* reverb predelay time */
let y = CombC(z, 0.1, LfNoise1({ Rand(0, 0.1) } ! 6) * 0.04 + 0.05, 15).Sum; /* six modulated comb delays in parallel */
4.timesRepeat {
	y := AllpassC(y, 0.050, { Rand(0, 0.05) } ! 2, 1) /* allpass delays on each of two channels */
};
LeakDc(y, 0.995)
