-- envPerc
let a = 0.1
    p = envPerc 0.01 1
    e = envGen kr 1 a 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
