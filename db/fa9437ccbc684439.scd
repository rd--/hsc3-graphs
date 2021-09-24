// bells / cylinders ; https://github.com/cianoc/supercollider_fragments
{var totalHarm = 10
;var att = 0
;var burstLength = 0.0001
;var freqSpecs = Ref.new(
 [{100.rrand(1200)}.dup(totalHarm)
 ,{0.3.rrand(1.0)}.dup(totalHarm).normalizeSum.round(0.01)
 ,{2.0.rrand(4.0)}.dup(totalHarm)])
;var burstEnv = Env.perc(0, burstLength)
;var burst = PinkNoise.ar(EnvGen.kr(burstEnv, gate: Impulse.kr(1)))
;Klank.ar(freqSpecs, burst) * MouseX.kr(0.1, 0.8)}
