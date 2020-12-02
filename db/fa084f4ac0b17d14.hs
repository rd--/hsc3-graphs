-- runningSum ; rms power
let input = lfSaw AR 440 0 * 0.1
    numsamp = 30
in runningSum (input * input) numsamp / (sqrt numsamp)
