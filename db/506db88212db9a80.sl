(********** Modal space ; mouse x controls discrete pitch in dorian mode ; Jmcc **********)
let mix = SinOsc( (* lead tone *)
	(DegreeToKey(
		[0 2 3 5 7 9 10].asLocalBuf,
		MouseX(0, 15, 0, 0.2), (* mouse indexes into scale *)
		12) (* 12 notes per octave *)
		+ 72
		+ LfNoise1([3 3]).Mul(0.04)).MidiCps,
	0) * 0.1
+ Rlpf(LfPulse([48 55].MidiCps, 0, 0.15), (* drone 5ths *)
	SinOsc(0.1, 0).MulAdd(10, 72).MidiCps, 0.1).Mul(0.1);
CombN(mix, 0.31, 0.31, 2) + mix
