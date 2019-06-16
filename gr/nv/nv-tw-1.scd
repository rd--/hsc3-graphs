{a = PinkNoise.ar(1 ! 2)
;50.do(
 {f = LFNoise1.kr(0.05.rand).exprange(40,15000)
 ;a = BBandStop.ar(a,f,exprand(0.1,2))})
;LPF.ar(a,1e5)
}.play
