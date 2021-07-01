-- tartini ; comparison of input frequency (x) and tracked oscillator frequency (f).
let x = mouseX kr 440 880 Exponential 0.1
    o = lfSaw ar x 0 * 0.05 {- sinOsc ar x 0 * 0.1 -}
    [f,_e] = mceChannels (X.tartini kr o 0.2 2048 0 1024 0.5)
    r = sinOsc ar f 0 * 0.1
    t = impulse kr 4 0
    pf = poll t f 0 (label "f")
    px = poll t x 0 (label "x")
in mrg [out 0 (mce2 o r),pf,px]
