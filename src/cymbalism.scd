{var p = 15
;var f1 = Rand.new(500,2500)
;var f2 = Rand.new(0,8000)
;var y = {var f = Array.fill(p,{f1 + Rand.new(0,f2)} )
         ;var rt = Array.fill(p,{1 + Rand.new(0,4)})
         ;`[f,nil,rt]}
;var z = Array.fill(2,y)
;var t = Impulse.ar(Rand.new(0,3) + 0.5,0)
;var n = WhiteNoise.ar() * 0.03
;var s = Decay.ar(t,0.004) * n
;Out.ar(0,Klank.ar(z,s))}.play
