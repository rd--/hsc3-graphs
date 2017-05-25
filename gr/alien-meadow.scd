// alien meadow (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.(
{var a = 20.0.rand
;var b = 5000.0.rand
;var c = 20.0.rand
;var p = 1.0.rand2
;var o1 = SinOsc.ar(a, 0) * (0.1 * b) +  b
;var o2 = SinOsc.kr(c, 0) * 0.05 + 0.05
;var o3 = SinOsc.ar(o1, 0, o2)
;Pan2.ar(o3, p)}, sustainTime:6, transitionTime:2, overlap:6)
