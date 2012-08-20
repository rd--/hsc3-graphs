{var d = 6
;var c = 5
;var a = 4
;var s_ = {var n = Dust.ar(2 / d)
          ;var r = Rand.new(0,3000)
          ;Resonz.ar(n * 50,200 + r,0.003)}
;var s = Mix.ar(Array.fill(d,s_))
;var z = DelayN.ar(s,0.048)
;var y_ = LFNoise1.kr(Array.fill(c,{Rand.new(0,0.1)}),0.04,0.05)
;var y = Mix.ar(CombL.ar(z,0.1,y_,15))
;var x = y
;var x_ = {var r = [Rand.new(0,0.05),Rand.new(0,0.05)]
          ;x = AllpassN.ar(x,0.050,r,1)}
;a.do(x_)
;Out.ar(0,s + (0.2 * x))}.play
