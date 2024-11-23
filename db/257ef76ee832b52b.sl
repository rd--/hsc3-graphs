/* http://scsynth.org/t/6264/4 ; pt */
let numPartials = 24;
let numVoices = 16;
let partialList = [1 .. numPartials];
let detune = 0.2;
Voicer(1, numVoices) { :e |
	let detuneList = (LfNoise1(0.2) # numPartials * detune).MidiRatio;
	let freqEnv = TxLine(1 - e.y * 2, 1, partialList ^ 0.7 / 10, e.w);
	let freq0 = e.p.UnitCps;
	let freqList = freq0 * partialList * detuneList * freqEnv;
	let osc = SinOsc(freqList, { TRand(0, 2 * pi, e.w) } ! numPartials);
	let dampen = 0.9 * (1 - e.z);
	let sig = osc / (partialList ^ dampen.Max(0.01));
	let atk = e.y + 0.1 * (partialList ^ 0.6) * ({ TRand(0.5, 1.5, e.w) } ! numPartials);
	let rel = e.y + 0.1 * 14 / (partialList + 3 ^ 0.9) * ({ TExpRand(0.5, 2, e.w) } ! numPartials);
	let envs = Perc(e.w, atk, rel, -4);
	EqPan2((sig * envs).sum, e.i)
}.Sum * 0.1
