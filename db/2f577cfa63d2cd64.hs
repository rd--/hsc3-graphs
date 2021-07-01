-- envPerc
let a = 0.1
    c = EnvNum (-4)
    p = envPerc_c 0.01 1 a (c,c)
    e = envGen kr 1 1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
