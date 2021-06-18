-- clustered sines (jmcc) #2 ; texture=xfade,4,4,inf ; edit for packet size
let cs _ =
      let n = 65
          f1 = rand 100 1100
          y = listfill n (\_ -> f1 + rand 0 (4 * f1))
          sp = klangdata y (map (f1 /) y) (replicate n 0)
      in klang 1 0 sp * 0.3 / n
in mcefill 2 cs
