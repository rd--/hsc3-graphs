// bells / cylinders, variation ; https://github.com/cianoc/supercollider_fragments
{var totalHarm = 10
;var att = 0
;var burstLength = 0.0001
;var freqSpecs = Ref.new(
 [{1.rrand(30) * 100 * 0.9.rrand(1.1)}.dup(totalHarm)
 ,{0.1.rrand(0.9)}.dup(totalHarm).normalizeSum
 ,{1.0.rrand(3.0)}.dup(totalHarm)])
;var burstEnv = Env.perc(0, burstLength)
;var burst = PinkNoise.ar(EnvGen.kr(burstEnv, gate: Impulse.kr(1)))
;Klank.ar(freqSpecs, burst) * MouseX.kr(0.1, 0.8)}
