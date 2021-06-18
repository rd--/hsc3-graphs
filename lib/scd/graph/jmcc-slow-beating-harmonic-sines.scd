// slow beating harmonic sines (jmcc) #7 ; texture=xfade,6,3,inf
{var n = 8 /* number of notes */
;var d = 0.4 /* beat frequency deviation */
;var m = 5 /* harmonics per note */
;var p = Array.new(m * n)
;var q = Array.new(m * n)
;var k = 24 + Rand.new(lo: 0, hi: 12)
;var z = nil
;n.do(
  {var freq = (TChoose.kr(trig: 1, array: [0,2,4,5,7,9]) + (Rand.new(lo: 0, hi: 7) * 12) + k).midicps
  ;p.add(freq + Rand.new(lo: d.neg,hi: d))
  ;p.add(freq * 2 + Rand.new(lo: d.neg,hi: d))
  ;p.add(freq * 4 + Rand.new(lo: d.neg,hi: d))
  ;p.add(freq * 5 + Rand.new(lo: d.neg,hi: d))
  ;p.add(freq * 6 + Rand.new(lo: d.neg,hi: d))})
;n.do(
  {arg i
  ;var freq = p.at(m * i)
  ;q.add(freq + Rand.new(lo: d.neg,hi: d))
  ;q.add(freq * 2 + Rand.new(lo: d.neg,hi: d))
  ;q.add(freq * 4 + Rand.new(lo: d.neg,hi: d))
  ;q.add(freq * 5 + Rand.new(lo: d.neg,hi: d))
  ;q.add(freq * 6 + Rand.new(lo: d.neg,hi: d))})
;z = [`[p, nil, RRandN(numChannels: m * n, lo: 0, hi: 2pi)],
      `[q, nil, RRandN(numChannels: m * n, lo: 0, hi: 2pi)]]
;Klang.ar(specificationsArrayRef: z, freqscale: 1, freqoffset: 0) * (0.1 / n)}
