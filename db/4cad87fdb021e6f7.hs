-- envLinen
let t = envLinen 0.4 2 0.4 0.1
    e = envGen kr 1 1 0 1 RemoveSynth t
in sinOsc ar 440 0 * e
