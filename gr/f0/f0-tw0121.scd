//--tweet0121

{var a = SinOsc
;var z = a.kr(1/[8,7]) * a.kr(1/30,0,9)
;var l = (56,62..98).midicps
;var m = a.ar(1/[4,3])
;var o = a.ar(Select.kr(z,l),0,m)
;CombN.ar(o,1,1/[6,5],9).tanh}.play
