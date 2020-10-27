{ var n0 = LFNoise0.ar([20, 40])
; var n1 = LFNoise0.ar([5, 10])
; var x = MouseX.kr(0.012, 0.19, 'exponential', 0.1)
; var f = Formlet.ar(Blip.ar(10, 12), n0 * 43 + 700, 0.005, x)
; var o = SinOsc.ar(40, 0) * n1
; LeakDC.ar(f + o, 0.995).clip2(0.75) }.play
