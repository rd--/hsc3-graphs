-- MiRipples
let tr = impulse ar 4 0
    input = decay tr 0.1
    cf = tRandId 'α' 0.1 0.6 tr
    filt = rlpf cf 80 0.3
in X.miRipples input filt 0.8 3 * 0.5
