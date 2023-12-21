-- f0 <https://twitter.com/redFrik/status/1338987643057688579>
let b = [8..18]
    x = VarSaw ([18.1,  81.8,  1.81] + b) 1 (VarSaw (b / 81) 0 0.5)
    t = VarSaw (8 / 1.818) ([1,  8 / 18]) 0.5
    d = (VarSaw (b / 181.8) 0 0.5 `toExpRange` (1.81 / 818,  1.8 / 181.8)) `roundTo` (1.81 / 818)
    c = VarSaw (1 / 8) (1 / b) 0.5 + 8.18 * 1.8
    z = VarSaw (1 / 81.8) 0 0.5 `toLinRange` (1.8 ** (-1),  8.1 / 8.18)
    p = (Pluck x t (1.8 / 181.8) d c z * (VarSaw (1.8 / b) 0 0.5) / 1.8)
in Hpf (Splay2 p) (18 / 1.81)
