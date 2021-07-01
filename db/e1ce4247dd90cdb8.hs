-- envADSR ; random release time
let g = setResetFF 1 (dustId 'α' kr 1)
    p = envADSR 0.01 0.25 0.15 0.75 1 (EnvNum (-4)) 0
    e = envGen kr g 0.1 0 1 RemoveSynth p
in sinOsc ar 440 0 * e
