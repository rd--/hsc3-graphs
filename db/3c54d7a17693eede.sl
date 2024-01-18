{- https://scsynth.org/t/6264/4 ; pt -}
let numPartials = 24;
let numVoices = 16;
let partialArray = [1 .. numPartials];
let detune = 0.2;
Voicer(1, 16) { :e |
	let detuneArray = (LfNoise1(0.2) ! numPartials * detune).MidiRatio;
	let freqEnv = TxLine(1 - e.y * 2, 1, partialArray ^ 0.7 / 10, e.w);
	let freq0 = e.p.UnitCps;
	let freqArray = freq0 * partialArray * detuneArray * freqEnv;
	let osc = SinOsc(freqArray, { TRand(0, 2 * pi, e.w) } ! numPartials);
	let dampen = 0.9 * (1 - e.z);
	let sig = osc / (partialArray ^ dampen.Max(0.01));
	let atk = e.y + 0.1 * (partialArray ^ 0.6) * ({ TRand(0.5, 1.5, e.w) } ! numPartials);
	let rel = e.y + 0.1 * 14 / (partialArray + 3 ^ 0.9) * ({ TExpRand(0.5, 2, e.w) } ! numPartials);
	let envs = Perc(e.w, atk, rel, -4);
	EqPan2((sig * envs).sum, e.i)
}.Sum * 0.1
