-- trigAvg
let n = X.trigAvg KR (sinOsc AR 0.1 0) (impulse KR 0.2 0)
in sinOsc AR 220 0 * n * 0.25
