// zizle (jmcc) #SC3d1.5
Texture.overlap(
{var a = {arg f; Mix.ar(SinOsc.ar(f * [rrand(0.7,1.3),1], [2pi.rand,2pi.rand], 0.1))}
;var a1 = a.(exprand(0.3,8)).max(0)
;var a2 = a.(exprand(6,24)).abs
;Pan2.ar(SinOsc.ar(rrand(24,108).midicps, 2pi.rand) * a1 * a2,1.0.rand2)}
,4, 4, 12)
