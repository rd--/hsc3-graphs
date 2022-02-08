-- bGenCheby ; shaper ; mouse control
let z = sinOsc ar 400 (pi / 2) * mouseY kr 0.01 1 Exponential 0.2
    t = bGenChebyTbl ("tbl", 0, 4096) [1, 0, 1, 1, 0, 1]
in shaper t z * 0.1
