-- runningMax
let n = dust ar 20
    t = impulse ar 0.4 0
    f = runningMax n t * 500 + 200
in t + sinOsc ar f 0 * 0.2
