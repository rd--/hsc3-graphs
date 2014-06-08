// sprinkler (jmcc)

{var f = LFPulse.kr(0.09,0,0.16,10,7)
;var t = LFPulse.kr(f,0,0.25,0.1)
;Out.ar(0,BPZ2.ar(WhiteNoise.ar * t))}.play

{var f = MouseX.kr(0.2,50)
;var t = LFPulse.kr(f,0,0.25,0.1)
;Out.ar(0,BPZ2.ar(WhiteNoise.ar * t))}.play
