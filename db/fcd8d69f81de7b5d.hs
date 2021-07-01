-- sinOsc ; with frequency of zero, operates as table lookup variant of sin
let mk_phasor (l,r) f = phasor ar 0 ((r - l) * f / sampleRate) l r l
    ph = mk_phasor (0,two_pi) 440
    o1 = sinOsc ar 440 0
    o2 = sinOsc ar 0 ph
    o3 = sin ph
in mce2 o1 (xFade2 o2 o3 (lfTri kr 0.1 0) 1) * 0.1
