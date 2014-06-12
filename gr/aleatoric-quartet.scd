// aleatoric quartet (jmcc) #7

{ var amp = 0.07
; var density = MouseX.kr(0.01, 1, 'linear', 0.1)
; var dmul = density.reciprocal * 0.5 * amp
; var dadd = amp - dmul
; var rapf = { arg i
             ; var r = Array.fill(2, { Rand(0, 0.05) })
             ; AllpassN.ar(i, 0.05, r, 1) }
; var mk_f = { var i0 = IRand(0, 2)
             ; var r0 = Select.kr(i0, [1, 0.5, 0.25])
             ; var r1 = Rand(-30, 30)
             ; var n0 = LFNoise0.kr(r0)
             ; var m = Lag.kr((n0 * 7 + 66 + r1).round(1), 0.2)
             ; m.midicps }
; var mk_s = { var f = mk_f.().reciprocal
             ; var r = Rand(-1, 1)
             ; var n0 = PinkNoise.ar
             ; var n1 = LFNoise1.kr(8)
             ; var x = n0 * 0.max(n1 * dmul + dadd)
             ; Pan2.ar(CombL.ar(x, 0.02, f, 3), r, 1) }
; var g = Mix.fill(4, mk_s)
; 5.do({ g = rapf.(g) })
; LeakDC.ar(g, 0.995) }.play
