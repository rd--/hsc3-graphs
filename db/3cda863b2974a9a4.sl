/* Strummable silk (Jmcc) #11 */
let x = MouseX(0, 1, 0, 0.2);
let str = (1 .. 8).collect { :ix |
	let n = 15;
	let tr = Hpz1(x > (0.25 + (ix - 1 * 0.07))).Abs;
	let env = Decay(Impulse(14, 0) * Lag(Trig(tr, 1), 0.2) * 0.01, 0.04);
	let pluck = PinkNoise() * env;
	let freq = ([-2 0 3 5 7 10 12 15][ix] + 60).MidiCps;
	let metal = RingzBank(
		pluck,
		(1 .. n) * freq,
		[1],
		{ Rand(0.3, 1) } ! n
	);
	EqPan(metal, ix - 1 * 0.2 - 0.5)
};
let s = LeakDc(Lpf(str.Sum, 12000), 0.995);
6.timesRepeat {
	s := AllpassN(s, 0.1, { 0.05.Rand0 } ! 2, 4)
};
s
