-- f0 <https://twitter.com/redFrik/status/1338987643057688579>
let b = [8..18]
    x = varsaw ([18.1, 81.8, 1.81] + b) 1 (varsaw (b/81) 0 0.5)
    t = varsaw (8/1.818) ([1, 8/18]) 0.5
    d = (varsaw (b/181.8) 0 0.5 `toexprange` (1.81/818, 1.8/181.8)) `round` (1.81/818)
    c = varsaw (1/8) (1/b) 0.5 + 8.18 * 1.8
    z = varsaw (1/81.8) 0 0.5 `tolinrange` (1.8 ** (-1), 8.1/8.18)
    p = (pluck x t (1.8/181.8) d c z * (varsaw (1.8/b) 0 0.5)/1.8)
in hpf (splay p 1 1 0 true) (18/1.81)
