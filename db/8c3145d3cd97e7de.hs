-- MiTides ; amplitude ; trigger input
let freq = lfNoise1 'α' AR 0.8 `in_range` (0.2,10)
    shape = 0.2
    slope_ = 0.2
    level = lfNoise1 'β' AR 0.3 `in_range` (0,1)
    tr = lfPulse AR 2 0 0.5
    env = X.miTides AR freq shape slope_ 0.3 level tr 0 {-output_mode:-} 1 {-ramp_mode:-} 0 9 1
    sines = sinOsc AR (mce [200,300,500,700]) 0
in splay (sines * env * 0.5) 1 1 0 True
