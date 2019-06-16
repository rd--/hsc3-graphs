// phase modulation with slow beats (jmcc) #6

"overlap-texture.scd".loadRelative;

~overlap_texture.(
{var x = MouseX.kr(100, 6000, 'exponential') /* random frequency of new events */
;var y = MouseY.kr(0, 2) /* modulation index */
;var f = Rand(0,x)
;var ph = 0
;3.do(
  {var f_ = Rand(0,x)
  ;ph = FSinOsc.ar([f_, f_ + 1.0.rand2], 0) * y + ph})
;SinOsc.ar([f, f + 1.0.rand2], ph) * 0.1}, 4, 4, 4)
