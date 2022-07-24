-- clustered sines (jmcc) #2 ; texture=XFade,4,4,inf ; edit for packet size
let cs _ =
      let n = 65
          f1 = Rand 100 1100
          y = listFill n (\_ -> f1 + Rand 0 (4 * f1))
          sp = klangData y (map (f1 /) y) (replicate n 0)
      in Klang 1 0 sp * 0.3 / n
in mceFill 2 cs
