// birdies (jmcc) #6
{Texture.overlapGraph(
{arg tr
;var p1 = LFPulse.kr(0.4 + TRand.kr(0,1,tr), 0, TRand.kr(0,0.8,tr) + 0.1, TRand.kr(0,3,tr) + 4, 2)
;var p2 = LFPulse.kr(0.4 + TRand.kr(0,1,tr), 0, TRand.kr(0,0.8,tr) + 0.1, TRand.kr(0,3,tr) + 4)
;var p3 = LFPulse.kr(0.2 + TRand.kr(0,0.5,tr), 0, 0.4, 0.02)
;var sw = LFSaw.kr(p1 + p2, 0, (1000 + TRand.kr(0,800,tr)).neg, 4000 + TRand.kr(-1200,1200,tr))
;var freq = Lag.kr(sw, 0.05)
;var amp = Lag.kr(p3, 0.3)
;Pan2.ar(SinOsc.ar(freq,0,amp), TRand.kr(-1,1,tr))
}, 7, 4, 4)}
