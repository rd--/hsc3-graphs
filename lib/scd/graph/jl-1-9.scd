// http://sccode.org/1-9 (jl)
{var n = 956
;var a = HPF.ar(PinkNoise.ar * 0.005,10) * Line.kr(0,1,9)
;var f = {arg i; Ringz.ar(a * LFNoise1.kr(0.05 + 0.1.rand),55 * (i + n) + 60,0.2)}
;GVerb.ar((f ! 99).sum,70,99).tanh}
