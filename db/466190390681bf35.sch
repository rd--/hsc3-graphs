-- f0 <https://twitter.com/redFrik/status/1343283697840226307>
let b = [2 .. 12] / 12
    f = [136.1, 163.3, 181.4, 204.1, 244.9, 272.1, 326.5, 362.8, 408.2, 489.8, 544.2]
    z = WhiteNoiseN 11 * ((LfTri b 0 + 1) / 2) + BrownNoise ()
    t = LfTri (121 ** LfTri (2 / 121 * b) 0) 0
    d = (Lag2 ((1 / 212) > LfTri (1 / 212.1) 0) (2 / b) / 12 * 1.2 + 1.2) / f
    p = Pluck z t (2 / 121) d (1 / 2 * 12 / 1.2) ((LfTri (b/12) 0 + 1) / 2)
in Splay (Hpf p 12) 1 (1 / 2.1 / 2) 0 True
