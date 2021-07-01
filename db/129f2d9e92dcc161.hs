-- compander ; compressor
let z = mix (pulse ar (mce2 80 81) 0.3) * decay2 (impulse ar 8 0 * lfSaw kr 0.3 0 * 0.3) 0.001 0.3
    x = mouseX kr 0.01 1 Linear 0.1
in mce [z, compander z z x 1 (1/3) 0.01 0.01]
