-- https://twitter.com/headcube/status/408145586970324992 (nv)
let mean l = foldl1 (+) l / length l
    f j =
      let i = j + 1
          a = saw ((1 / i + 1) / 6)
          p = pluck a a 1 (1 / i / (3 - lfpulse (1 / i) 0 0.5) / 30) 9 (0.9 / i)
          x = (0.5 ** i) * p
          o = sinosc 2 0 + [4, 9]
      in combc x 1 (o * 0.001) 0 - x
in mean (map f [0 .. 8]) / 9
