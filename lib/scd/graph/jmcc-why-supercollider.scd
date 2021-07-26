// why supercollider (jmcc) #0
{var r = {Resonz.ar(Dust.ar(0.2,50),Rand.new(200.0,3200.0),0.003)}
;var s = Mix.ar(Array.fill(10,r))
;var z = DelayN.ar(s,0.048)
;var c = {CombL.ar(z,0.1,LFNoise1.kr(Rand.new(0,0.1),0.04,0.05),15)}
;var x = Mix.ar(Array.fill(7,c))
;4.do({x = AllpassN.ar(x,0.050,[Rand.new(0,0.05),Rand.new(0,0.050)],1)})
;s + (0.2*x)}
