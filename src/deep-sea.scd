{ var amp = 1
; var pan = 0
; var variation = 0.9
; var n = Rand.new(7, 46)
; var dt1 = 25.0 + Rand.new(-1.7, 1.7)
; var dt2 = (dt1 + LFNoise2.kr(2)) * variation * 0.001
; var freq = 901 + Rand.new(0, 65)
; var t = Impulse.ar(dt2.reciprocal, 0, 100)
; var count = PulseCount.ar(t, 0)
; var mul = count < n
; var u1 = BPF.ar(mul * t, freq, 1) * 0.1
; var freq2 = freq * ((count % LFNoise1.kr(1).range(2, 20)) + 1)
; var u2 = BPF.ar(u1, freq2, 1) * 0.2
; DetectSilence.ar(u2, 0.0001, 0.2, 2)
; Out.ar(0, Pan2.ar(u2, pan, amp * 10)) }.play
