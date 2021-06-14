// inharmonic warbulence (jmcc) #12
RTexture.overlap(
{var f = Rand.new(lo: 24, hi: 96).midicps
;var a = 1.min(500/f)
;var r = XLine.kr(start: ExpRand.new(lo: 0.1, hi: 20), end: ExpRand.new(lo: 0.1, hi: 20), dur: 25.6, doneAction: 0)
;var n = 12
;a * Mix.arFill(n: n, function:
 {arg i
 ;var g = n.asFloat.rand + 1
 ;var m = SinOsc.kr(freq: r * Rand.new(lo: 0.9, hi: 1.1), phase: 2pi.rand, mul: 0.08, add: -0.04).max(0)
 ;Pan2.ar(in: FSinOsc.ar(freq: f * g, iphase: 0, mul: m) * (2/g), pos: Rand.new(lo: -1.0, hi: 1.0))})}
,12.8,6.4,6,2,postProcess:
{arg signal
;Mix.arFill(n: 5, function:
 {var dt = [Rand.new(lo: 0.1, hi: 0.3), Rand.new(lo: 0.1, hi: 0.3)]
 ;CombN.ar(in: signal, maxdelaytime: 0.3, delaytime: dt, decaytime: 8)}) * 0.3})

