-- runningMin
let n = dustId 'α' ar 20
    t = impulse ar 0.4 0
    f = runningMin n t * 500 + 200
in sinOsc ar f 0 * 0.2
