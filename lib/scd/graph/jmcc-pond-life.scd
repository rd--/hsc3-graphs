// pond life (jmcc) #1 ; texture=overlap,8,8,4,inf
{var f = FSinOsc.kr(20 + Rand.new(0,30),0,100 + Rand.new(0,300),500 + LinRand.new(0,2000))
;var o = SinOsc.ar(f,0,LFPulse.kr(3 / (1 + Rand.new(0,8)),0,0.2 + Rand.new(0,0.3),0.04))
;Pan2.ar(o,Rand.new(-1,1))}

// pond life (jmcc) #1 ; graph rewrite
{RTexture.overlapGraph(graphFunc:
{arg tr
;var f = FSinOsc.kr(TRand.kr(20,50,tr),0,TRand.kr(100,400,tr),TRand.kr(500,2500,tr)) // TLinRand
;var o = SinOsc.ar(f,0,LFPulse.kr(3/(1 + TRand.kr(0,8,tr)),0,TRand.kr(0.2,0.5,tr),0.04))
;Pan2.ar(o,TRand.kr(-1,1,tr))}
,sustainTime:8,transitionTime:8,overlap:4)}
