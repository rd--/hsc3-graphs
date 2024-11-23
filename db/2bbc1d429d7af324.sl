/* Bidirectional strummable guitar (Jmcc) #11 */
let pitch1 = [52 57 62 67 71 76];
let pitch2 = pitch1 + 7;
let mouseX = MouseX(0, 1, 0, 0.2);
let str = pitch1.indices.collect { :i |
	let trigger = Hpz1(mouseX > (0.25 + (i * 0.1)));
	let pluck1 = PinkNoise() * Decay(trigger.Max(0), 0.05);
	let period1 = pitch1[i].MidiCps.Recip;
	let string1 = CombL(pluck1, period1, period1, 4);
	let pluck2 = BrownNoise() * Decay(trigger.Neg.Max(0), 0.05);
	let period2 = pitch2[i].MidiCps.Recip;
	let string2 = CombL(pluck2, period2, period2, -4);
	EqPan2(string1 + string2, i * 0.2 - 0.5)
};
LeakDc(Lpf(str.Mix, 12000), 0.995)
