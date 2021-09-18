// tw 0020 (f0)
{var a = LFPulse
;var b = 4.iota + 1
;var a1 = (a.ar(b / 32) + 1)  /  8
;var a2 = (a.ar(a1) + 1) * b
;var a3 = a.ar(b / 64)
;var a4 = a.ar(a.ar(b / 8)) * 2 + b
;var a5 = a.ar(4 / b)
;var a6 = a.ar(a2)
;var a7 = a.ar((a6 + ((Mix.ar(a3) + a5) * a4)) * 100)
;(Mix.ar(a7) / 8) ! 2}

//---- calculations
1.series(2,4) == (4.iota + 1)
