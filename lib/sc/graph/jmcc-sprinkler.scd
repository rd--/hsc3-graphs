// sprinkler (jmcc) #1
{var f = LFPulse.kr(0.09,0,0.16) * 10 + 7
;var t = LFPulse.kr(f,0,0.25) * 0.1
;BPZ2.ar(WhiteNoise.ar * t)}.play
