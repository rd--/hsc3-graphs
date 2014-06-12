// what was i thinking? (jmcc) #2

{var n0 = LFNoise1.kr(0.2,2000,2400)
;var n1 = LFNoise1.kr(0.157,0.4,0.5)
;var i = LFPulse.ar(0.1,0,0.05) * Impulse.ar(8,0) * 500
;var d = Decay.ar(i,2)
;var f = max(SinOsc.kr(4,0) + 80,d)
;var p = Pulse.ar(f,n1) * 0.04
;var z = RLPF.ar(p,n0,0.2)
;var c = {arg i
         ;var r = Rand(0,0.3)
         ;var n = LFNoise1.kr(r,0.025,0.035)
         ;CombL.ar(i,0.06,n,1)}
;var y = z * 0.6
;z + [c.(y) + c.(y),c.(y) + c.(y)]}.play
