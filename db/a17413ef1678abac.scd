// tw 0020 (f0)
{var a=LFPulse
;var b=(1..4)
;var a1=(a.ar(b/32) + 1) / 8
;var a2=(a.ar(a1) + 1) * b
;var a3=a.ar(b/64)
;var a4=a.ar(a.ar(b/8)) * 2 + b
;var a5=a.ar(4/b)
;var a6=a.ar(a2)
;var a7=a.ar((a6 + ((Mix(a3) + a5) * a4)) * 100)
;(Mix(a7)/8)!2}
