-- mul ; ring modulation
let p = sinOsc ar (xLine kr 100 1001 10 DoNothing) 0
    q = syncSaw ar 100 200
in p * q * 0.25
