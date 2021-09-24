// pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
{var f = FSinOsc.kr(20 + Rand.new(0,30),0,100 + Rand.new(0,300),500 + LinRand.new(0,2000))
;var o = SinOsc.ar(f,0,LFPulse.kr(3 / (1 + Rand.new(0,8)),0,0.2 + Rand.new(0,0.3),0.04))
;Pan2.ar(o,Rand.new(-1,1))}
