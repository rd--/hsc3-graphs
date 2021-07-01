-- out ; kr ; see drawings section below for UI
let freq = mce [1,2,3,5,7,9,11,13,17,19,23]
    mul = control kr "mul" 0.1
    amp = control kr "amp" 0.1
in out 12000 (sinOsc kr (freq * mul) 0 * amp)
