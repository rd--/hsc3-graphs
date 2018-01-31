// why supercollider (jmcc) #0

{var r = {Resonz.ar(Dust.ar(0.2,50),200 + 3000.0.rand,0.003)}
;var s = Mix.ar(Array.fill(10,r))
;var z = DelayN.ar(s,0.048)
;var c = {CombL.ar(z,0.1,LFNoise1.kr(0.1.rand,0.04,0.05),15)}
;var y = Mix.ar(Array.fill(7,c))
;4.do({y = AllpassN.ar(y,0.050,[0.050.rand,0.050.rand],1)})
;s+(0.2*x)}.play
