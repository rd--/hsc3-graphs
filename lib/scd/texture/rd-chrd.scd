// chrd (rd)
RTexture.overlap(newEventFunc:
{var chrd =
  {arg m
  ;var ds = 3
  ;var d = [5, 4, 5, 7, 4, 5] * ds
  ;var f = XLine.kr(start: m, end: m + Rand.ir(lo: 0.05, hi: 0.5), dur: d, doneAction: 0).midicps
  ;var z = Env.sine(dur: d.maxItem, level: Rand.ir(lo: 0.005, hi: 0.01))
//;var z = Env.linen(attackTaime: r * d, sustainTime: 0, releaseTime: (1 - r) * d, level: Rand.ir(lo: 0.005, hi: 0.01))
  ;var e = EnvGen.kr(envelope: z, gate: 1, levelScale: 1, levelBias: 0, timeScale: 1, doneAction: 0)
  ;var p = XLine.kr(start: Rand.ir(lo: -1, hi: 1), end: Rand.ir(lo: -1, hi: 1), dur: d, doneAction: 0)
  ;var o = SinOsc.ar(freq: f, phase: 0)
  ;Mix.ar(Pan2.ar(in: o, pos: p, level: e))}
;var scale = [0, 2, 4, 5, 7, 9, 11]
;var octaves = [4, 5, 6, 7]
;var mnn = all {:n + (o * 12), n <- scale, o <- octaves}
;var chd = 6.collect({mnn.choose})
;Mix.fill(n: 9, function: {chrd.value(chd)})}, sustainTime: 21, transitionTime: 0, overlap: 3, numChannels: 2, maxRepeats: inf, postProcess: nil, bus: 0)
