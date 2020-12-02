-- MiTides ; gate
let freq = 5 -- attack rate
    shape = lfTri AR 0.13 0 `in_range` (0,1)
    slope_ = 0.5
    smooth = lfTri AR 0.1 0 `in_range` (0,1)
    tr = lfPulse AR 1 0 0.5
    env = X.miTides AR freq shape slope_ smooth 0.8 tr 0 {-output_mode:-} 0 {-ramp_mode:-} 0 1 9
    sine = pmOsc AR 150 300 2 0
    c0 = head . mceChannels
in sine * c0 env
