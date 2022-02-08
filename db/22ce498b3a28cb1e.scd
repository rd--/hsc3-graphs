// lg timed
{ var dcons = { arg x, xs
              ; var i = Dseq.dr([0, 1], 1)
              ; var a = Dseq.dr([x, xs], 1)
              ; Dswitch.dr(a, i) }
; var timed = { arg r, y, p
              ; var d0 = Dser.dr(p, r)
              ; var d1 = dcons.value(0, d0)
              ; var d2 = Dser.dr(y, r)
              ; var t = TDuty.ar(d1, 0, d2, 2, 1)
              ; Latch.ar(t, t) }
; var lg = { arg u
           ; Lag.ar(u, 0.03) }
; var n = [52, 76, 66, 67, 68, 69]
; var a = [0.35, 0.15, 0.04, 0.05, 0.16, 0.07]
; var d = [0.1, 0.5, 0.09, 0.08, 0.07, 0.3]
; var x = MouseX.kr(0.5, 1.25, 'linear', 0.2)
; var tn = lg.value(timed.value(inf, n, d * x))
; var ta = lg.value(timed.value(inf, a, d * x))
; SinOsc.ar(tn.midicps, 0) * ta }
