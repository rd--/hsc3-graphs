{ var f = { arg s1
          ; var rate = ExpRand(0.1, 2).dup
          ; var n1 = { LFNoise1.kr(rate).exprange(0.01, 10) }
          ; var n2 = { LFNoise1.kr(rate).exprange(10, 50) }
          ; var n3 = LFNoise1.kr(rate).exprange(2, 10)
          ; var f1 = if(0.6.coin) { n1.() } { n2.() }
          ; var s2 = [1 - s1, s1.reverse].choose
          ; var f2 = LinExp.kr(s1, -1, 1, f1, f1 * n3)
          ; var u1 = LFSaw.kr(f2, 0)
          ; var u2 = LFSaw.kr(f1 * 0.1, 0, 0.1, 1)
          ; var u3 = if(0.5.coin) { u1 * s2 } { u1 * u2 }
          ; u3.clip2(1) }
; var g = { arg func, n
          ; n.do { func = func <> func }
          ; func }
; var inp = LFSaw.kr(0.2 * [1, 1.1], 0)
; var b_freq = [70, 800, 9000, 5242]
; var ff = g.(f, 4).(inp)
; var c_saw = Saw.ar(ff.exprange(6, 11000)).product
; var b_saw = BPF.ar(c_saw, b_freq, 0.2).sum.dup
; b_saw * 0.3 }.play
