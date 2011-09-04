{ var a = 0.02
; var f = 50
; var p = 20
; var l = Line.kr(0, a.neg, 60, 0)
; var o = { arg h
          ; var r = 6 + [Rand.new(-4, 4), Rand.new(-4, 4)]
          ; var n = LFNoise1.kr(r)
          ; var e = max(0, n * a + l)
          ; FSinOsc.ar(f * (h + 1), 0) * e }
; Out.ar(0, (0..p).collect(o).sum) }.play
