-- trigAvg
let n = X.trigAvg kr (sinOsc ar 0.1 0) (impulse kr 0.2 0)
in sinOsc ar 220 0 * n * 0.25
