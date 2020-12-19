-- compander ; noise gate (no hold, no hysteresis) ; x = threshold
let z = mix (pulse AR (mce2 80 81) 0.3) * decay2 (impulse AR 8 0 * lfSaw KR 0.3 0 * 0.3) 0.001 0.3
    x = mouseX KR 0.01 0.15 Linear 0.1
in mce [z, compander z z x 10 1 0.002 0.15]
