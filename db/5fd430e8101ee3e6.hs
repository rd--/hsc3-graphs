-- sinOsc ; with frequency of zero, operates as table lookup variant of sin
let mk_phasor (l,r) f = phasor AR 0 ((r - l) * f / sampleRate) l r l
    ph = mk_phasor (0,two_pi) 440
    o1 = sinOsc AR 440 0
    o2 = sinOsc AR 0 ph
    o3 = sin ph
in mce2 o1 (xFade2 o2 o3 (lfTri KR 0.1 0) 1) * 0.1
