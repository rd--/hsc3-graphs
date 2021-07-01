-- rlpf ; c.f. rlpfd
let s = mix (lfSaw ar (mce2 120 180) 0 * 0.33)
    f = linExp (lfCub kr 0.1 (0.5 * pi)) (-1) 1 280 1500
    rq = mouseX kr 0.05 0.5 Linear 0.2
in rlpf s f rq * 0.1
