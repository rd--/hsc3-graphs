-- envGate ; several envGate nodes can coexist, if they are the same they are shared
let e = envGate_def
    s1 = lpf (saw AR 80) 600 * e
    s2 = rlpf (saw AR 200 * 0.5) (6000 * e + 60) 0.1 * e
in mce2 s1 s2 * 0.1
