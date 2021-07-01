-- linen
let e = linen (impulse kr 2 0) 0.01 0.6 0.4 DoNothing
in e * sinOsc ar 440 0 * 0.1
