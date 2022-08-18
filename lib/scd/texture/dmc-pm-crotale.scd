// pm-crotale (dmc) #1.7
{
	var tone = Rand.ir(1, 6);
	var art = Rand.ir(2, 6);
	var freq = IRand.ir(48, 72).midiCps;
	var env = Env.perc(0, art, 1, -4);
	var mod = 5 + (1 / IRand.ir(2, 6));
	var amp1 = EnvGen.kr(env, 1, Rand.ir(0.1, 0.3), 0, art, 0);
	var amp2 = EnvGen.kr(env, 1, Rand.ir(0.1, 0.5), 0, 1.3 * art, 2);
	var sig = PMOsc.ar(
		freq,
		mod * freq,
		EnvGen.kr(env, 1, tone, 0, art, 0),
		0
	);
	Pan2.ar(sig, Rand.ir(-1, 1), amp1 * amp2)
}.spawn({ 0.25.rrand(4) })

// pm-crotale (dmc) #1.7 ; keywords
{
	var tone = Rand.ir(lo: 1, hi: 6);
	var art = Rand.ir(lo: 2, hi: 6);
	var freq = IRand.ir(48, 72).midiCps;
	var env = Env.perc(attackTime: 0, releaseTime: art, level: 1, curve: -4);
	var mod = 5 + (1 / IRand.ir(2, 6));
	var amp1 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand.ir(0.1, 0.3), levelBias: 0, timeScale: art, doneAction: 0);
	var amp2 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand.ir(0.1, 0.5), levelBias: 0, timeScale: 1.3 * art, doneAction: 2);
	var sig = PMOsc.ar(
		carfreq: freq,
		modfreq: mod * freq,
		pmindex: EnvGen.kr(envelope: env, gate: 1, levelScale: tone, levelBias: 0, timeScale: art, doneAction: 0),
		modphase: 0
	);
	Pan2.ar(in: sig, pos: Rand.ir(lo: -1, hi: 1), level: amp1 * amp2)
}.spawn({ 0.25.rrand(4) })
