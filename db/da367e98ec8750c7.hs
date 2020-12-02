-- pulse ; two band limited square waves through a resonant low pass filter
let p = pulse AR (mce2 100 250) 0.5 * 0.1
    f = xLine KR 8000 400 5 DoNothing
in rlpf p f 0.05
