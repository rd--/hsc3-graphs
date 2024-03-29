{- Tmm881 ; http://scsynth.org/t/3319 ; edit (rd) ; requires=voicer -}
let pre = Voicer(1, 16) { :e |
	let freq = (e.x * 25 + 48).MidiCps + [0, TRand(1, 4, e.w)];
	let carriers = [SinOsc(freq, 0), Saw(freq), Pulse(freq, 0.5)];
	let modulators = { SinOsc(TRand(0.0322, 1.0, e.w) * 0.0647, 0) } ! carriers.size;
	let filterEnv = Env([3600, 220, 3600], [e.y * 2, 16], 2, 1, nil, 0).asEnvGen(e.w);
	EqPan2(
		Lpf((carriers * modulators).Sum, filterEnv),
		e.i * 2 - 1
	).Sum * LagUd(e.w * e.z, 0, 0.25)
}.Sum;
FreeVerb2(pre.first, pre.second, 0.33, 0.5, 0.5)
