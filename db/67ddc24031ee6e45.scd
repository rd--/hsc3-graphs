// pretty ; nice, but inessential ; https://github.com/cianoc/supercollider_fragments
{var f =
 {arg i
 ;var freq = MouseX.kr(0.1.rrand(5.0), 3.0.rrand(20.0))
 ;var amp = 0.max(LFNoise0.kr(MouseX.kr(1.rrand(6), 6.rrand(1))))
 ;var osc = SinOsc.ar(SinOsc.ar(freq, mul: MouseY.kr(10, 50), add: 200.rrand(5000)), mul: amp)
 ;Pan2.ar(osc, 1.0.rand2)}
;Mix.fill(12, f) * 0.03}
