-- summer
let s_trig = dustId 'α' kr 5
    s_reset = impulse kr 0.5 0
in sinOsc ar (X.summer s_trig (mce2 0.5 0.25) s_reset 1 * 100) 0 * 0.1
