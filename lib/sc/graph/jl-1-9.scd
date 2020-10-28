// http://sccode.org/1-9 (jl)
{var n = 956
;var a = ar(HPF,ar(PinkNoise) * 0.005,10) * kr(Line,0,1,9)
;var f = {arg i; ar(Ringz,a * kr(LFNoise1,0.05 + 0.1.rand),55 * (i + n) + 60,0.2)}
;tanh(ar(GVerb,(f ! 99).sum,70,99))}.play
