// saucer base (jmcc) #6 ; texture=overlap,6,2,4,inf
{var a = Rand.new(0,20)
;var b = Rand.new(0,1000)
;var c = Rand.new(0,5000)
;var p = Rand.new(-1,1)
;var o1 = SinOsc.ar(a, 0) * b + (1.1 * b)
;var o2 = SinOsc.ar(o1, 0) * c + (1.1 * c)
;var o3 = SinOsc.ar(o2, 0) * 0.1
;Pan2.ar(o3, p)}
