// jmcc - inharmonic warbulence ; graph rewrite
{var z = RTexture.overlapGraph(graphFunc:
 {arg tr
 ;var f = TRand.kr(lo: 24, hi: 96, trig: tr).midicps
 ;var a = 1.min(500/f)
 ;var r = TXLine.kr(start: TExpRand.kr(lo: 0.1, hi: 20, trig: tr), end: TExpRand.kr(lo: 0.1, hi: 20, trig: tr), dur: 25.6, trig: tr)
 ;var n = 12
 ;Mix.arFill(n,
  {arg i
  ;var g = TRand.kr(lo: 0, hi: n, trig: tr) + 1
  ;var m = SinOsc.kr(freq: r * TRand.kr(lo: 0.9, hi: 1.1, trig: tr), phase: TRand.kr(lo: 0, hi: 2 * pi, trig: tr), mul: 0.08, add: -0.04).max(0)
  ;Pan2.ar(in: SinOsc.ar(freq: f * g, phase: 0, mul: m * (2 / g)), pos: TRand.kr(lo: -1, hi: 1, trig: tr), level: 1)}) * 0.1}, sustainTime: 12.8, transitionTime: 6.4, overlap: 6)
;Mix.arFill(5, {CombN.ar(in: z, maxdelaytime: 0.3, delaytime: [0.1.rrand(0.3), 0.1.rrand(0.3)], decaytime: 8)}) * 0.3}
