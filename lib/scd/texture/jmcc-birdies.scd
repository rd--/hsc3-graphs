// birdies (jmcc) #6
Texture.overlap(
{var p1 = LFPulse.kr(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4, 2)
;var p2 = LFPulse.kr(0.4 + 1.0.rand, 0, 0.8.rand + 0.1, 3.0.rand + 4)
;var p3 = LFPulse.kr(0.2 + 0.5.rand, 0, 0.4, 0.02)
;var sw = LFSaw.kr(p1 + p2, 0, (1000 + 800.rand).neg, 4000 + 1200.rand2)
;var freq = Lag.kr(sw, 0.05)
;var amp = Lag.kr(p3, 0.3)
;Pan2.ar(SinOsc.ar(freq,0,amp), 1.0.rand2)
}, 7, 4, 4)
