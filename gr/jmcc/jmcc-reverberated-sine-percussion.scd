// reverberated sine percussion (jmcc) #3

{{arg d, c, a
 ;var s = Mix.ar(Array.fill(d,{Resonz.ar(Dust.ar(2 / d) * 50,200 + Rand(0,3000),0.003)}))
 ;var z = DelayN.ar(s,0.048,0.048)
 ;var y_ = LFNoise1.kr(Array.fill(c,{Rand(0,0.1)}),0.04,0.05)
 ;var y = Mix.ar(CombL.ar(z,0.1,y_,15))
 ;var x = y
 ;a.do({x = AllpassN.ar(x,0.050,[Rand(0,0.05),Rand(0,0.05)],1)})
 ;s + (0.2 * x)}.(6,5,4)}.play
