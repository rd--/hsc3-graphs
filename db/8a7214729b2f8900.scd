// karplus strong ; https://github.com/cianoc/supercollider_fragments
{var att = 0
;var dec = 0.001
;var delayDecay = 0.5
;var midiPitch = 69
;var delayTime = midiPitch.midicps.reciprocal
;var burstEnv = EnvGen.kr(Env.perc(att, dec), gate: Impulse.kr(1/delayDecay))
;var burst = PinkNoise.ar(burstEnv)
;CombL.ar(burst, delayTime, delayTime, delayDecay, add: burst)}
