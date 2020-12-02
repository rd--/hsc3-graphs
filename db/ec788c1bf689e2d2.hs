-- runningSum ; running average over x samples
let x = 100 in runningSum (lfSaw AR 440 0 * 0.1) x * recip x
