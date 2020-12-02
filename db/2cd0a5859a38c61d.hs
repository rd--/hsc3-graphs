-- MiTides ; amplitude mode
let freq = 0.15
    shape = 0.2
    slope_ = 0.2
    level = lfTri AR 0.1 0 `in_range` (0,1)
    env = X.miTides AR freq shape slope_ 0.3 level 0 0 {-output_mode:-} 1 {-ramp_mode:-} 1 9 1
    sines = sinOsc AR (mce [200,300,500,900]) 0
in splay (sines * env) 1 1 0 True
