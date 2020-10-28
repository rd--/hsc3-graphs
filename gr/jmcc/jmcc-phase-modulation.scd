// phase modulation with slow beats (jmcc) #6
Texture.overlap(
{var x = MouseX.kr(100, 6000, 'exponential') /* random frequency of new events */
;var y = MouseY.kr(0, 2) /* modulation index */
;var f1 = Rand(0,x)
;var ph = 0
;3.do(
  {var f2 = Rand(0,x)
  ;ph = FSinOsc.ar([f2, f2 + 1.0.rand2], 0) * y + ph})
;SinOsc.ar([f1, f1 + 1.0.rand2], ph) * 0.1}, 4, 4, 4)
