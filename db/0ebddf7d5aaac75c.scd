// pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
{var f = FSinOsc.kr(20 + Rand(0,30),0,100 + Rand(0,300),500 + LinRand(0,2000))
;var o = SinOsc.ar(f,0,LFPulse.kr(3 / (1 + Rand(0,8)),0,0.2 + Rand(0,0.3),0.04))
;Pan2.ar(o,Rand(-1,1))}
