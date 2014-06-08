// babbling brook (jmcc)

{ var b = { arg f, m, a, g
          ; { var n1 = OnePole.ar(BrownNoise.ar, 0.99)
            ; var n2 = LPF.ar(BrownNoise.ar, f)
            ; RHPF.ar(n1, n2 * m + a, 0.03, g) } }
; var x = b.value(14, 400, 500, 0.006) ! 2
; var y = b.value(20, 800, 1000, 0.010) ! 2
; Out.ar(0, x + y) }.play
