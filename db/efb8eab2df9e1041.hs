-- envADSR ; random release time
let g = setResetFF 1 (dust 'α' KR 1)
    p = envADSR 0.01 0.25 0.15 0.75 1 (EnvNum (-4)) 0
    e = envGen KR g 0.1 0 1 RemoveSynth p
in sinOsc AR 440 0 * e
