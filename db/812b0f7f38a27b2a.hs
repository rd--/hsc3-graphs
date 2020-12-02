-- linen
let e = linen (impulse KR 2 0) 0.01 0.6 0.4 DoNothing
in e * sinOsc AR 440 0 * 0.1
