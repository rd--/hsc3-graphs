-- runningMax
let n = dust 'α' AR 20
    t = impulse AR 0.4 0
    f = runningMax n t * 500 + 200
in t + sinOsc AR f 0 * 0.2
