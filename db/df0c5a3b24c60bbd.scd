// RTXLine ; start and end reset randomly every 4 seconds, ramp every trigger
{var trig = Impulse.kr(1/4, 0)
;var f0 = TExpRand.kr(110, 450, trig)
;var f1 = TExpRand.kr(110, 440, trig)
;Splay.ar(SinOsc.ar([f0,RTXLine.kr(f0, f1, 4, trig),f1],0)) * [0.05,0.1,0.05]}
