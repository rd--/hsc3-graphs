-- trig1 ; timed gate, duration in seconds
let d = dustId 'α' ar 1
    o = fSinOsc ar 800 0 * 0.1
in o * trig1 d 1.25
