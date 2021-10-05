// pm-crotale (dmc) #1.7
RTexture.spawn(
{var midi = IRand.ir(48, 72)
;var tone = Rand.ir(1, 6)
;var art = Rand.ir(2, 6)
;var pan = Rand.ir(-1, 1)
;var freq = midi.midicps
;var env = Env.perc(attackTime: 0, releaseTime: art, level: 1, curve: -4)
;var mod = 5 + (1 / IRand.ir(2, 6))
;var amp_1 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand.ir(0.1, 0.3), levelBias: 0, timeScale: art, doneAction: 0)
;var amp_2 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand.ir(0.1, 0.5), levelBias: 0, timeScale: 1.3 * art, doneAction: 2)
;var sig = PMOsc.ar(carfreq: freq, modfreq: mod * freq, pmindex: EnvGen.kr(envelope: env, gate: 1, levelScale: tone, levelBias: 0, timeScale: art, doneAction: 0), modphase: 0)
;Pan2.ar(in: sig, pos: pan, level: amp_1 * amp_2)},2,{0.25.rrand(4)})
