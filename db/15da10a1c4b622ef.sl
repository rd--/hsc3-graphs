{- http://sccode.org/1-4Qy (F0) ; 0250 -}
let f = Latch(LfSaw(1.50055, [0 0.0005] # 2), LfSaw([15 4 2], 0)) * [999 400 150];
let o = LfSaw(f, 0).Mix;
AllpassC(o / 4, 3, 2 - LfSaw(0.1, [0 1]), 1)
