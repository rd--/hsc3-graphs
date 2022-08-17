-- envAdsr
let c = control kr "gate" 1
    p = envAdsr 0.75 2.75 0.1 7.25 1 (EnvNum (-4)) 0
    e = envGen kr c 1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e * 0.1
