-- tartini ; printer for pitch tracker
let i = soundIn 0
    [f,_e] = mceChannels (X.tartini KR i 0.2 2048 0 1024 0.5)
    r = sinOsc AR f 0 * 0.1
    t = impulse KR 4 0
    pf = poll t f 0 (label "f")
in mrg [out 0 (mce2 i r),pf]
