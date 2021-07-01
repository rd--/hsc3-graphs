-- demand
let n = diwhiteId 'α' dinf 60 72
    t = impulse kr 10 0
    s = midiCPS n
    f = demand t 0 s
    o = sinOsc ar (mce [f,f + 0.7]) 0
in cubed (cubed o) * 0.1
