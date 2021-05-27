// jmcc - inharmonic warbulence
{var z = RTexture.overlapGraph(
 {arg tr
 ;var f = TRand.kr(24, 96, tr).midicps
 ;var a = 1.min(500/f)
 ;var r = RTXLine.kr(TExpRand.kr(0.1,20,tr),TExpRand.kr(0.1,20,tr), 25.6, tr)
 ;var n = 12
 ;Mix.arFill(n,
  {arg i
  ;var g = TRand.kr(0,n,tr) + 1
  ;var m = SinOsc.kr(r * TRand.kr(0.9,1.1,tr), TRand.kr(0,2pi,tr), 0.08, -0.04).max(0)
  ;Pan2.ar(FSinOsc.ar(f * g, 0, m) * (2 / g),TRand.kr(-1,1,tr))}) * 0.1}, 12.8, 6.4, 6, 2)
;Mix.arFill(5, {CombN.ar(z, 0.3, [0.1.rrand(0.3), 0.1.rrand(0.3)], 8)}) * 0.3}
