-- pitch ; comparison of input frequency (x) and tracked oscillator frequency (f)
let x = mouseX KR 440 880 Exponential 0.1
    o = sinOsc AR x 0 * 0.1
    [f,_] = mceChannels (pitch o 440 60 4000 100 16 7 0.02 0.5 1 0)
    r = sinOsc AR f 0 * 0.1
    t = impulse KR 4 0
    pf = poll t f 0 (label "f")
    px = poll t x 0 (label "x")
in mce [out 0 (mce2 o r),pf,px]
