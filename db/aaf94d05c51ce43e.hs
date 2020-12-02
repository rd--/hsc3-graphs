-- envASR ; control
let g = control KR "env-gate" 1
    p = envASR 0.01 1 1 (EnvNum (-4))
    e = envGen KR g 0.1 0 1 RemoveSynth p
in sinOsc AR 440 0 * e
