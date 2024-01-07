(* https://schollz.com/blog/phasedistortion/ ; requires=voicer *)
Voicer(1, 16) { :e |
	let freq = (e.x * 36 + 48).MidiCps; (* e.p.UnitCps *)
	let amp = e.z;
	let freqBase = freq;
	let freqRes = LinLin(SinOsc(Rand(0, 0.2), 0), -1, 1, freqBase / 2, freqBase * 2);
	let pdBase = Impulse(freqBase, 0);
	let twoPi = 2 * pi;
	let pd = Phasor(pdBase, twoPi * freqBase / SampleRate(), 0, twoPi, 0);
	let pdRes = Phasor(pdBase, twoPi * freqRes / SampleRate(), 0, twoPi, 0);
	let pdi = LinLin((twoPi - pd).Max(0), 0, twoPi, 0, 1);
	let snd = Lag(SinOsc(0, pdRes) * pdi, 1 / freqBase);
	let env = Decay2(Trig(e.w, SampleDur()), 0.005, 10);
	EqPan2(snd, e.i * 2 - 1) * env * amp
}.Mix
