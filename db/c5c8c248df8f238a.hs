-- tartini ; comparison of input frequency (x) and tracked oscillator frequency (f).
let x = mouseX KR 440 880 Exponential 0.1
    o = lfSaw AR x 0 * 0.05 {- sinOsc AR x 0 * 0.1 -}
    [f,_e] = mceChannels (X.tartini KR o 0.2 2048 0 1024 0.5)
    r = sinOsc AR f 0 * 0.1
    t = impulse KR 4 0
    pf = poll t f 0 (label "f")
    px = poll t x 0 (label "x")
in mrg [out 0 (mce2 o r),pf,px]
