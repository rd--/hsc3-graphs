-- http://sccode.org/1-4Qy (f0) (requires -w 512) ; edited for packet size
let mean l = Mix l / length l
    n = 50
    z i = let o1 = LfSaw (map ((i + 1) /) [3, 4]) 0
              o2 = LfSaw ((i + 1) / 8) 0 + 1
              f0 = (o1 > o2) * (n / 2) + n
              m = LfSaw ((i + 1) / n) (i / (n / 2))
              o3 = Blip f0 (map (i +) [2, 3]) * m
          in Ringz o3 ((i + 1) * (n * 2 - 1)) 0.1
in mean (map z [1, 3 .. n]) / 10
