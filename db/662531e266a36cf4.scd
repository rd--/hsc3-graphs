// police state (jmcc) #2
{var node =
  {var r0 = Rand(0.02,0.12)
  ;var r1 = Rand(0,2pi)
  ;var r2 = Rand(0,600)
  ;var r3 = 1000 + Rand(-300,300)
  ;var r4 = Rand(-1,1)
  ;var r5 = 100 + Rand(-20,20)
  ;var n0 = LFNoise2.ar(r5)
  ;var f = SinOsc.kr(r0,r1,r2,r3)
  ;Pan2.ar(SinOsc.ar(f,0) * n0 * 0.1,r4,1)}
;var n0 = LFNoise2.kr([0.4,0.4])
;var n1 = LFNoise2.ar(n0 * 90 + 620)
;var n2 = LFNoise2.kr([0.3,0.3])
;var e = n1 * (n2 * 0.15 + 0.18)
;CombL.ar(Mix.fill(4,node) + e,0.3,0.3,3)}
