-- lpf
let k = 32
    n = mceFill k (\i -> lpf (dust2Id i ar (int_to_ugen i + 1 / 3)) 1500)
in splay n (lfNoise2Id 'α' kr 0.1 `in_range` (0,1)) 1 0 True
