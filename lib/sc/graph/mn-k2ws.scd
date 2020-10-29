// https://www.listarc.bham.ac.uk/lists/sc-users/msg21341.html
{var fc = 400 + LFNoise2.ar([1,2]).range(100,200)
;var fm = LFNoise0.ar(5).range(100,200)
;var i = LFNoise1.ar(10).range(1,20)
;var x = SinOsc.ar(fc + (SinOsc.ar(fm) * i * fm)) * 0.5
;var rf = SinOsc.ar(LFNoise1.ar(1).range(0.1,1)).range(1000,2000)
;var rq = LFNoise1.ar(1).range(0.5,10)
;var a = RLPF.ar(x, rf, rq)
;var ph = a * LFNoise1.ar(0.1).range(1.0,4.0) * 4pi
;SinOsc.ar(0.2,ph) * 0.25}
