-- runningMin
let n = dust 'α' AR 20
    t = impulse AR 0.4 0
    f = runningMin n t * 500 + 200
in sinOsc AR f 0 * 0.2
