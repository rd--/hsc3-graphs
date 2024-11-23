/* https://sonomu.club/@lukiss/109733997253009229 ; Jan 23, 2023 */
let c = [9, 12 .. 61].degreeToKey([0 2 3 6 7 8 11], 12);
let o = c.MidiCps.collect { :f | SinOsc(f, 0) };
let e = SinOsc(2 / c.Log10, 0) * LfSaw(11 / c.Neg, 0).Max(0).Lag3(0.1);
Splay(
	LeakDc(o * e, 0.995),
	SinOsc(1 / c @ 1, 0)
)
