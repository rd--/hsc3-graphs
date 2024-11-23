/* Harmonic zither (Jmcc) #11 ; mouse control */
let pitch = [50 53.86 57.02 59.69 62 64.04 65.86 67.51 69.02 71.69 72.88 74];
let triggerSpacing = 0.5 / (pitch.size - 1);
let panSpacing = 1.5 / (pitch.size - 1);
let strings = pitch.indices.collect { :i |
	let trigger = Hpz1(MouseX(0, 1, 0, 0.2) > (0.25 + i * triggerSpacing)).Abs;
	let pluck = PinkNoise() * Decay(trigger, 0.05);
	let period = pitch[i].MidiCps.Recip;
	let string = CombL(pluck, period, period, 8);
	EqPan(string, i - 1 * panSpacing - 0.75)
};
LeakDc(Lpf(strings.Sum, 12000), 0.995)
