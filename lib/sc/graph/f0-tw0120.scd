// tw 0120 (f0)
{var a = LFTri
;var z = a.kr(1/[7,8])*a.kr(1/9,0,99)
;var l = (60..79).midicps
;var f = Select.kr(z,l)
;var w = a.kr(1/[3,4])%1
;var o = VarSaw.ar(f,0,w)
;CombN.ar(o,1,1/[5,6],8)/8}
