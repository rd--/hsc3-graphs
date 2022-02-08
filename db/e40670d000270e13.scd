// pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
{var f = FSinOsc.kr(Rand.ir(20, 50), 0) * Rand.ir(100,400) + LinRand.ir(500,2500)
;var o = SinOsc.ar(f, 0) * LFPulse.kr(3 / Rand.ir(1, 9), 0, Rand.ir(0.2, 0.5)) * 0.04
;Pan2.ar(o, Rand.ir(-1,1), 1)}
