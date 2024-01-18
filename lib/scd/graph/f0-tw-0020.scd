// tw 0020 (f0)
{var a = {arg freq; LFPulse.ar(freq, 0, 0.5)}
;var b = (1 .. 4)
;var a1 = a.value(b / 32) + 1 /  8
;var a2 = a.value(a1) + 1 * b
;var a3 = a.value(b / 64)
;var a4 = a.value(a.value(b / 8)) * 2 + b
;var a5 = a.value(4 / b)
;var a6 = a.value(a2)
;var a7 = a.value((a6 + ((Mix.ar(a3) + a5) * a4)) * 100)
;(Mix.ar(a7) / 8) ! 2}

//---- calculations
1.series(2,4) == (4.iota + 1) // iota
