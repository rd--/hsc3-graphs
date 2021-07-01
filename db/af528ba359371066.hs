-- envTriangle
let t = envTriangle 1 0.1
    e = envGen kr 1 1 0 1 RemoveSynth t
in sinOsc ar 440 0 * e
