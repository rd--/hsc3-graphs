-- out ; kr ; see drawings section below for UI
let freq = mce [1,2,3,5,7,9,11,13,17,19,23]
    mul = control KR "mul" 0.1
    amp = control KR "amp" 0.1
in out 12000 (sinOsc KR (freq * mul) 0 * amp)
