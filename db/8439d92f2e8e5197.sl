/********** Strummable silk ; Jmcc **********/
let mousex = MouseX(0, 1, 0, 0.2);
let out = 1:8.collect { :ix |
	let n = 15;
	/* place trigger points from 0.25 to 0.75 */
	let trigger = Hpz1(mousex > (0.25 + (ix - 1 * 0.07))).Abs;
	let pluck = PinkNoise() * Decay(Impulse(14, 0).Mul(Lag(Trig(trigger, 1), 0.2) * 0.01), 0.04);
	let freq = ([-2 0 3 5 7 10 12 15].at(ix) + 60).MidiCps;
	let metal = RingzBank(pluck,
		1:n * freq, /* frequencies */
		nil, /* amplitudes default to 1.0 */
		{ Rand(0.3, 1.0) } ! n); /* ring times */
	EqPan2(metal, ix * 0.2 - 0.5)
}.Sum.Lpf( 12000).LeakDc(0.995);
6.timesRepeat {
	out := AllpassN(out, 0.1, [0.05.Rand0, 0.05.Rand0], 4)
};
out
