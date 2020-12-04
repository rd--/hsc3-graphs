-- envTriangle
let t = envTriangle 1 0.1
    e = envGen KR 1 1 0 1 RemoveSynth t
in sinOsc AR 440 0 * e
