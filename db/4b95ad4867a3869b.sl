/* ImpulseSequencer ; Jmcc */
let trig = ImpulseSequencer([2 1 1 2 1 1 2 1] / 10, Impulse(8, 0));
let amp = Decay2(trig, 0.0004, 0.2);
let x = Resonz(GrayNoise(amp # 2, 0), 5200, 0.2);
4.timesRepeat {
	x := AllpassN(x, 0.05, { 0.05.Rand0 } ! 2, 4)
};
x
