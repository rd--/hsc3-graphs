(* Reso pulse ; Jmcc *)
let z = { :tr |
	let f = TChoose(tr, [25 30 34 37 41 42 46 49 53 54 58 61 63 66]).MidiCps;
	LfPulse(f, 0, 0.2) + LfPulse(2 * f + TRand(-0.5, 0.5, tr), 0, 0.2)
}.OverlapTexture(4, 2, 4).Sum;
let lfoFreq = 6;
let lfo = LfNoise0(lfoFreq).MulAdd(1000, 1200);
let left = Rlpf(
	z * 0.02,
	lfo, (* cutoff freq *)
	MouseX(0.2, 0.02, 1, 0.2)
); (* filter bandwidth *)
let delayTime = 2 / lfoFreq;
let right = DelayN(left, delayTime, delayTime); (* delay right channel by two beats *)
[left, right]
