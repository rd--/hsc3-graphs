-- envSine
let s = envSine 9 0.1
    e = envGen KR 1 1 0 1 RemoveSynth s
in sinOsc AR 440 0 * e
