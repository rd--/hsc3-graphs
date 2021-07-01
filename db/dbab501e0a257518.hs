-- envSine
let s = envSine 9 0.1
    e = envGen kr 1 1 0 1 RemoveSynth s
in sinOsc ar 440 0 * e
