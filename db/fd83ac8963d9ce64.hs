-- envAdsr ; adsr_def
let g = control kr "gate" 1
    p = envAdsr_r adsr_def
    e = envGen kr g 0.1 0 1 DoNothing p
in sinOsc ar 440 0 * e
