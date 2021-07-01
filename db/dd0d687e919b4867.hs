-- envPairs
let c = EnvLin
    p = envPairs [(0,0),(5,0.01),(5.5,0.1),(10,0)] c
    e = envGen kr 1 1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
