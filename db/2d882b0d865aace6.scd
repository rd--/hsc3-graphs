// f0 ; https://twitter.com/redFrik/status/1395878538297892865
{var t = Impulse.ar(5)
;var g = [3,2]
;var e = t.lagud(0.001,SinOscFB.ar(g/99)+1.08)
;var m = ([24,0,3,5,7,10,36]+.t[36,48,36,33,60,72]).flat
;var o = SinOscFB.ar(Demand.ar(t,0,Dseq.new(m.midicps,inf)/g),SinOscFB.ar(0.02),e)
;var c = RLPF.ar(o,3**SinOscFB.ar(0.04)+e*2e3,3**SinOscFB.ar(g/9)/3,4)
;(CombN.ar(c.tanh,1,1/2,4)+CombN.ar(c,1,1/3,5)/8+c).tanh * 0.1}
