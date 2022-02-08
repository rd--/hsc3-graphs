// chrd (rd) ; graph rewrite
{RTexture.overlapGraph(graphFunc:
{arg tr
;var chrd =
  {arg m
  ;var ds = 3
  ;var d = [5, 4, 5, 7, 4, 5] * ds
  ;var f = TXLine.kr(start: m, end: m + TRand.kr(lo: 0.05, hi: 0.5, trig: tr), dur: d, trig: tr).midicps
  ;var z = Env.sine(dur: d.maxItem, level: TRand.kr(lo: 0.005, hi: 0.01, trig: tr))
  ;var e = EnvGen.kr(envelope: z, gate: tr, levelScale: 1, levelBias: 0, timeScale: 1, doneAction: 0)
  ;var p = TXLine.kr(start: TRand.kr(lo: -1, hi: 1, trig: tr), end: TRand.kr(lo: -1, hi: 1, trig: tr), dur: d, trig: tr)
  ;var o = SinOsc.ar(freq: f, phase: 0)
  ;Mix.ar(Pan2.ar(in: o, pos: p, level: e))}
;var scale = [0, 2, 4, 5, 7, 9, 11]
;var octaves = [4, 5, 6, 7]
;var mnn = scale.collect({arg n; octaves.collect({arg o; n + (o * 12)})}).flatten
;var chd = 6.collect({TChoose.kr(trig: tr, array: mnn)})
;Mix.fill(n: 9, function: {chrd.value(chd)})}, sustainTime: 21, transitionTime: 0, overlap: 3)}
