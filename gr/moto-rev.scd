// moto rev (jmcc)

{ var f = SinOsc.kr(0.2, 0) * 10 + 21
; var s = LFPulse.ar(f, [0, 0.1], 0.1)
; Out.ar(0, RLPF.ar(s, 100, 0.1).clip2(0.4)) }.play
