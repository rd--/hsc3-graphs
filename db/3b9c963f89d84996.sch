-- http://sccode.org/1-V (nv) [Line 40]
let nd i =
        let t = (0.6 ** i) * 40 * Impulse ((2 ** i) / 32) (1 / 2)
            f = (4 ** LfNoise0 (1 / 16)) * 300
        in sin (Rlpf t f 0.005)
    x = Splay2 (map nd [0 .. 7])
    r u = FreeVerb2 (at u 1) (at u 2) 0.1 1 1
in r (r x)
