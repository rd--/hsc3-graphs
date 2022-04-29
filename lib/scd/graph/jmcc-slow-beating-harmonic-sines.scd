// slow beating harmonic sines (jmcc) #7 ; texture=xfade,6,3,inf
{var n = 8 // number of notes
;var d = 0.4 // beat frequency deviation
;var m = 5 // harmonics per note
;var p = Array.new(m * n)
;var q = Array.new(m * n)
;var k = 24 + Rand.ir(0, 12)
;var z = nil
;n.do(
  {var freq = (TChoose.kr(1, #[0,2,4,5,7,9]) + (Rand.ir(0, 7) * 12) + k).midicps
  ;p.add(freq + Rand.ir(d.neg,d))
  ;p.add(freq * 2 + Rand.ir(d.neg,d))
  ;p.add(freq * 4 + Rand.ir(d.neg,d))
  ;p.add(freq * 5 + Rand.ir(d.neg,d))
  ;p.add(freq * 6 + Rand.ir(d.neg,d))})
;n.do(
  {arg i
  ;var freq = p.at(m * i)
  ;q.add(freq + Rand.ir(d.neg,d))
  ;q.add(freq * 2 + Rand.ir(d.neg,d))
  ;q.add(freq * 4 + Rand.ir(d.neg,d))
  ;q.add(freq * 5 + Rand.ir(d.neg,d))
  ;q.add(freq * 6 + Rand.ir(d.neg,d))})
;z = [Ref.new([p, nil, RandN.ir(m * n, 0, 2 * pi)]),
      Ref.new([q, nil, RandN.ir(m * n, 0, 2 * pi)])]
;Klang.ar(z, 1, 0) * (0.1 / n)}

//---- slow beating harmonic sines (jmcc) #7 ; texture=xfade,6,3,inf
{var n = 8 // number of notes
;var d = 0.4 // beat frequency deviation
;var m = 5 // harmonics per note
;var p = Array.new(m * n)
;var q = Array.new(m * n)
;var k = 24 + Rand.ir(lo: 0, hi: 12)
;var z = nil
;n.do(
  {var freq = (TChoose.kr(trig: 1, array: [0,2,4,5,7,9]) + (Rand.ir(lo: 0, hi: 7) * 12) + k).midicps
  ;p.add(freq + Rand.ir(lo: d.neg,hi: d))
  ;p.add(freq * 2 + Rand.ir(lo: d.neg,hi: d))
  ;p.add(freq * 4 + Rand.ir(lo: d.neg,hi: d))
  ;p.add(freq * 5 + Rand.ir(lo: d.neg,hi: d))
  ;p.add(freq * 6 + Rand.ir(lo: d.neg,hi: d))})
;n.do(
  {arg i
  ;var freq = p.at(m * i)
  ;q.add(freq + Rand.ir(lo: d.neg,hi: d))
  ;q.add(freq * 2 + Rand.ir(lo: d.neg,hi: d))
  ;q.add(freq * 4 + Rand.ir(lo: d.neg,hi: d))
  ;q.add(freq * 5 + Rand.ir(lo: d.neg,hi: d))
  ;q.add(freq * 6 + Rand.ir(lo: d.neg,hi: d))})
;z = [Ref.new([p, nil, RandN.ir(numChannels: m * n, lo: 0, hi: 2 * pi)]),
      Ref.new([q, nil, RandN.ir(numChannels: m * n, lo: 0, hi: 2 * pi)])]
;Klang.ar(specificationsArrayRef: z, freqscale: 1, freqoffset: 0) * (0.1 / n)}
