-- pitch ; comparison of input frequency (x) and tracked oscillator frequency (f)
let x = mouseX kr 440 880 Exponential 0.1
    o = sinOsc ar x 0 * 0.1
    [f,_] = mceChannels (pitch o 440 60 4000 100 16 7 0.02 0.5 1 0)
    r = sinOsc ar f 0 * 0.1
    t = impulse kr 4 0
    pf = poll t f 0 (label "f")
    px = poll t x 0 (label "x")
in mce [out 0 (mce2 o r),pf,px]
