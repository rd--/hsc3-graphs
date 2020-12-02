// sweepy noise (jmcc) #6
{var lfoDepth = MouseY.kr(200,8000,'exponential',0.1)
;var lfoRate = MouseX.kr(4,60,'exponential',0.1)
;var freq = LFSaw.kr(lfoRate,0) * lfoDepth + (lfoDepth * 1.2)
;var filtered = RLPF.ar(WhiteNoise.ar([0.03,0.03]),freq,0.1)
;CombN.ar(filtered,0.3,0.3,2) + filtered}
