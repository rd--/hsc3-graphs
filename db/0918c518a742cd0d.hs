-- demand
let n = diwhite 'α' dinf 60 72
    t = impulse KR 10 0
    s = midiCPS n
    f = demand t 0 s
    o = sinOsc AR (mce [f,f + 0.7]) 0
in cubed (cubed o) * 0.1
