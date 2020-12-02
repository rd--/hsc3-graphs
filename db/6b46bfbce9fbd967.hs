-- tartini ; test live pitch tracking, not careful with amplitude of input
let z = hpf (soundIn 0) 90
    [f,e] = mceChannels (X.tartini KR z 0.2 2048 0 1024 0.5)
in mce2 (z * 0.1) (lfTri AR f 0 * 0.2 * lag e 0.2 * lag (f >** 90 * f <** 500) 0.2)
