{ var mod = 7
; var detune = 0
; var x = MouseX.kr(0, 0.9, 'linear', 0.2)
; var y = MouseY.kr(4000, 200, 'exponential', 0.8)
; var f = y + detune
; var f_ = f + (f * SinOsc.ar(mod, 0) * 0.02)
; var a = SinOsc.ar(f_, 0) * x
; Out.ar(0, (Pan2.ar(a, 0, 1))) }.play
