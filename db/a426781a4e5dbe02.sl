/********** Monastic resonance ; mouse controls size and reverb time ; Jmcc **********/
let decayTime = MouseX(0, 16, 0, 0.2);
let delayScale = MouseY(0.01, 1, 0, 0.2);
let s = AudioIn([1, 2]) * 0.005;
let z = DelayN(Sum(s), 0.048, 0.048); /* reverb predelay time */
let y = Sum(CombL(z, 0.1, { 0.04.Rand2 + 0.05 } ! 8 * delayScale, decayTime)); /* 8 comb delays in parallel */
5.timesRepeat { /* chain of 5 allpass delays on each of two channels (10 total) */
	y := AllpassN(y, 0.050, [0.050.Rand0, 0.050.Rand0], 1)
};
LeakDc(y, 0.995) /* eliminate DC */
