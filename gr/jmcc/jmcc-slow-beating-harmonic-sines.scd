// slow beating harmonic sines (jmcc) #7
Texture.xfade(
{var n = 8 /* number of notes */
;var d = 0.4 /* beat frequency deviation */
;var m = 5 /* harmonics per note */
;var p = Array(m * n)
;var q = Array(m * n)
;var k = 24 + 12.rand
;var z = nil
;n.do(
  {var freq = (#[0,2,4,5,7,9].choose + (7.rand * 12) + k).midicps
  ;p.add(freq + d.rand2)
  ;p.add(freq * 2 + d.rand2)
  ;p.add(freq * 4 + d.rand2)
  ;p.add(freq * 5 + d.rand2)
  ;p.add(freq * 6 + d.rand2)})
;n.do(
  {arg i
  ;var freq = p.at(m * i)
  ;q.add(freq + d.rand2)
  ;q.add(freq * 2 + d.rand2)
  ;q.add(freq * 4 + d.rand2)
  ;q.add(freq * 5 + d.rand2)
  ;q.add(freq * 6 + d.rand2)})
;z = [`[p, nil, Array.rand(m * n, 0, 2pi)],
      `[q, nil, Array.rand(m * n, 0, 2pi)]]
;Klang.ar(z) * (0.1 / n)}, 6, 3)
