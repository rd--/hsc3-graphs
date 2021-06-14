// pm-crotale (dmc) #1.7
RTexture.spawn(
{var midi = IRand(48,72)
;var tone = Rand(1,6)
;var art = Rand(2,6)
;var pan = Rand(-1,1)
;var freq = midi.midicps
;var env = Env.perc(attackTime: 0, releaseTime: art, level: 1, curve: -4)
;var mod = 5 + (1 / IRand(2,6))
;var amp_1 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand(0.1,0.3), levelBias: 0, timeScale: art, doneAction: 0)
;var amp_2 = EnvGen.kr(envelope: env, gate: 1, levelScale: Rand(0.1,0.5), levelBias: 0, timeScale: 1.3 * art, doneAction: 2)
;var sig = PMOsc.ar(carfreq: freq, modfreq: mod * freq, pmindex: EnvGen.kr(envelope: env, gate: 1, levelScale: tone, levelBias: 0, timeScale: art, doneAction: 0), modphase: 0)
;Pan2.ar(in: sig, pos: pan, level: amp_1 * amp_2)},2,{rrand(0.25,4)})
