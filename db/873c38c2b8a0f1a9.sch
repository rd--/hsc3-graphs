-- http://sccode.org/1-V (nv) [Line 40]
let nd i =
        let t = (0.6 ** i) * 40 * impulse ((2 ** i) / 32) (1 / 2)
            f = (4 ** lfnoise0 (1 / 16)) * 300
        in sin (rlpf t f 0.005)
    x = splay (map nd [0 .. 7]) 1 1 0 true
    r u = freeverb2 (mcechannel u 0) (mcechannel u 1) 0.1 1 1
in r (r x)
