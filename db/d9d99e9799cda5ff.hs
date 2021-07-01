-- MiTides ; phasing envs
let freq = 10
    shape = 0.2
    slope_ = 0.5
    shift_ = lfTri ar 0.1 0 `in_range` (0,1)
    trig = lfPulse ar 5 0 0.5
    env = X.miTides ar freq shape slope_ 0.5 shift_ trig 0 {-output_mode:-} 2 {-ramp_mode:-} 0 9 1
    sines = sinOsc ar (mce [200,300,500,700]) 0
in splay (sines * env * 0.25) 1 1 0 True
