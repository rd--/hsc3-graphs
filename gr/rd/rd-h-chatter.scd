{ var h0 = { var n = LFNoise0.kr(1, 5, 5)
           ; var a = LFNoise0.kr(1, 0.2, 1.2)
           ; var b = LFNoise0.kr(1, 0.15, 0.15)
           ; var f = 40
           ; var h = HenonN.ar([f, f * 0.5], a, b, 0, 0)
           ; Saw.ar(h * 3200 + 1600) * 0.35 }
; var h1 = { var n0 = LFNoise0.kr(32)
           ; var n1 = LFNoise0.kr(2)
           ; var a = MouseX.kr(1.2, 1.4, 'linear', 0.1)
           ; var b = MouseY.kr(0.2, 0.3, 'linear', 0.1)
           ; var h = n0.range(1, 32)
           ; var p = n1.range(2400, 3200)
           ; var l = n1.range(-0.75, 0.75)
           ; var g = n1.range(0.55, 0.85)
           ; var f = 40
           ; var o = Blip.ar(HenonN.ar(f, a, b, 0, 0).range(p, p * 2), h)
           ; Pan2.ar(o, l, g) * 0.35 }
; h0.() + h1.() }.play
