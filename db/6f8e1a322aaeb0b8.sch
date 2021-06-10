-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
let n = 5
    pkt i =
      let a = lfsaw ((i + 1) * 5) 0 * 0.5 * pi
          b = sinosc ((i + 1) * 0.001) 0 * 0.5
          c = max (lfsaw (0.2 + b) (i / n) * 0.4) 0
          d = sinosc 0.03 (i + 1) * 0.5 + 1
          e = sinosc (200 + i) 0 * d
          f = sinosc 0.04 (i + 2) * 0.5 + 1
          g = sinosc (400 + i) 0 * f
          h = sinosc 0.05 (i + 3) * 0.5 + 1
          j = sinosc (800 + i) 0 * h
          k = linexp i 0 (n - 1) 70 1500
          z = sinosc k a * c * e * g * j
          l = linlin i 0 (n - 1) (-0.925) 0.925
      in pan2 z l (1 / n)
    y = limiter (leakdc (mixfill n pkt) 0.995) 1 0.01
in gverb y 3 5 0.2 0.8 20 0.1 0.7 0.5 300 * 0.2
