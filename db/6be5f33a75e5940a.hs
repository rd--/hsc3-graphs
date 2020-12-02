-- envLinen
let t = envLinen 0.4 2 0.4 0.1
    e = envGen KR 1 1 0 1 RemoveSynth t
in sinOsc AR 440 0 * e
