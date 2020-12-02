// slow beating sines (jmcc) #7 ; texture=xfade,4,4,inf
{var n = 20 /* n * 3 components in each channel */
;var d = 5.0 /* beating frequency deviation */
;var p = Array(3 * n)
;var q = Array(3 * n)
;var z = nil
;n.do(
  {var freq = (24 + Rand(0,60)).midicps
  ;p.add(freq)
  ;p.add(freq + Rand(d.neg,d))
  ;p.add(freq + Rand(d.neg,d))})
;n.do(
  {arg i
  ;var freq = p.at(3 * i)
  ;q.add(freq + Rand(d.neg,d))
  ;q.add(freq + Rand(d.neg,d))
  ;q.add(freq + Rand(d.neg,d))})
;z = [`[p, nil, RandN(3 * n, 0, 2 * pi)],
      `[q, nil, RandN(3 * n, 0, 2 * pi)]]
;Klang.ar(z) * (0.1 / n)}
