-- rlpf ; c.f. rlpfd
let s = mix (lfSaw AR (mce2 120 180) 0 * 0.33)
    f = linExp (lfCub KR 0.1 (0.5 * pi)) (-1) 1 280 1500
    rq = mouseX KR 0.05 0.5 Linear 0.2
in rlpf s f rq * 0.1
