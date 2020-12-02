-- trig1 ; timed gate, duration in seconds
let d = dust 'α' AR 1
    o = fSinOsc AR 800 0 * 0.1
in o * trig1 d 1.25
