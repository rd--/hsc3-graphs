{var n = 20
;var e = Dust.ar(100,0.04)
;var f = XLine.kr(3000,300,8)
;var l = Line.kr(1.0.rand2,1.0.rand2,8)
;var r = Array.fill(n,{200 + 3000.0.linrand})
;var t = Array.fill(n,{0.2 + 1.0.rand})
;var k = Klank.ar(`[r,nil,t],Resonz.ar(e,f,0.2))
;Pan2.ar(k,l)
}.play
