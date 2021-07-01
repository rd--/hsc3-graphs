-- pulse ; two band limited square waves through a resonant low pass filter
let p = pulse ar (mce2 100 250) 0.5 * 0.1
    f = xLine kr 8000 400 5 DoNothing
in rlpf p f 0.05
