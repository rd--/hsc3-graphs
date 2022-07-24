-- http://sccode.org/1-V (nv) [Line 40]
let nd i =
        let t = (0.6 ** i) * 40 * Impulse ((2 ** i) / 32) (1 / 2)
            f = (4 ** LFNoise0 (1 / 16)) * 300
        in sin (RLPF t f 0.005)
    x = Splay (map nd [0 .. 7]) 1 1 0 True
    r u = FreeVerb2 (mceChannel u 0) (mceChannel u 1) 0.1 1 1
in r (r x)
