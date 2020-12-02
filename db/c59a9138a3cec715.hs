-- envADSR
let c = control KR "gate" 1
    p = envADSR 0.75 2.75 0.1 7.25 1 (EnvNum (-4)) 0
    e = envGen KR c 1 0 1 RemoveSynth p
in sinOsc AR 440 0 * e * 0.1
