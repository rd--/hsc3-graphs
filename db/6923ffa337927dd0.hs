-- envASR ; random release time
let g = setResetFF 1 (dustId 'α' kr 1)
    p = envASR 0.01 1 1 (EnvNum (-4))
    e = envGen kr g 0.1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
