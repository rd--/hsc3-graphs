-- mul ; ring modulation
let p = sinOsc AR (xLine KR 100 1001 10 DoNothing) 0
    q = syncSaw AR 100 200
in p * q * 0.25
