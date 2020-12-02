-- envPerc
let a = 0.1
    p = envPerc 0.01 1
    e = envGen KR 1 a 0 1 RemoveSynth p
in sinOsc AR 440 0 * e
