// sprinkler mouse (jmcc) #1
{var f = MouseX.kr(0.2,50)
;var t = LFPulse.kr(f,0,0.25,0.1)
;BPZ2.ar(WhiteNoise.ar * t)}.play
