// saucer base (jmcc) #6
Texture.overlap(
{var a = 20.0.rand
;var b = 1000.0.rand
;var c = 5000.0.rand
;var p = 1.0.rand2
;var o1 = SinOsc.ar(a, 0) * b + (1.1 * b)
;var o2 = SinOsc.ar(o1, 0) * c + (1.1 * c)
;var o3 = SinOsc.ar(o2, 0) * 0.1
;Pan2.ar(o3, p)}, 6, 2, 4)
