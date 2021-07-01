-- tartini ; printer for pitch tracker
let i = soundIn 0
    [f,_e] = mceChannels (X.tartini kr i 0.2 2048 0 1024 0.5)
    r = sinOsc ar f 0 * 0.1
    t = impulse kr 4 0
    pf = poll t f 0 (label "f")
in mrg [out 0 (mce2 i r),pf]
