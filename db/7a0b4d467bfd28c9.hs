-- offsetOut
let a = offsetOut 0 (impulse ar 5 0)
    b = out 0 (sinOsc ar 60 0 * 0.1)
in mrg2 a b
