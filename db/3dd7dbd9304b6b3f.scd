// pond life (jmcc) #1 ; graph rewrite
{RTexture.overlapGraph(
{arg tr
;var f = FSinOsc.kr(TRand.kr(20,50,tr),0,TRand.kr(100,400,tr),TRand.kr(500,2500,tr)) // TLinRand
;var o = SinOsc.ar(f,0,LFPulse.kr(3/(1 + TRand.kr(0,8,tr)),0,TRand.kr(0.2,0.5,tr),0.04))
;Pan2.ar(o,TRand.kr(-1,1,tr))}
,sustainTime:8,transitionTime:8,overlap:4)}
