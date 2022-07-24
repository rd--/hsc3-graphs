-- http://www.fredrikolofsson.com/f0blog/?q=node/490 (f0)
let n = 5
    pkt i =
      let a = LFSaw ((i + 1) * 5) 0 * 0.5 * pi
          b = SinOsc ((i + 1) * 0.001) 0 * 0.5
          c = Max (LFSaw (0.2 + b) (i / n) * 0.4) 0
          d = SinOsc 0.03 (i + 1) * 0.5 + 1
          e = SinOsc (200 + i) 0 * d
          f = SinOsc 0.04 (i + 2) * 0.5 + 1
          g = SinOsc (400 + i) 0 * f
          h = SinOsc 0.05 (i + 3) * 0.5 + 1
          j = SinOsc (800 + i) 0 * h
          k = LinExp i 0 (n - 1) 70 1500
          z = SinOsc k a * c * e * g * j
          l = LinLin i 0 (n - 1) (-0.925) 0.925
      in Pan2 z l (1 / n)
    y = Limiter (LeakDC (mixFill n pkt) 0.995) 1 0.01
in GVerb y 3 5 0.2 0.8 20 0.1 0.7 0.5 300 * 0.2
