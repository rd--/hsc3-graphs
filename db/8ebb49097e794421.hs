-- envADSR ; adsr_def
let g = control KR "gate" 1
    p = envADSR_r adsr_def
    e = envGen KR g 0.1 0 1 DoNothing p
in sinOsc AR 440 0 * e
