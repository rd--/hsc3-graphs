-- MiTides ; phasing
let shape = 0.2
    slope_ = 0.0
    shift_ = lfNoise1Id 'α' ar 0.3 `in_range` (0,1) -- slightly shift phases
    smooth = lfNoise1Id 'β' kr 0.02 `in_range` (0.1,0.9)
    sig = X.miTides ar 70 shape slope_ smooth shift_ 0 0 {-output_mode:-} 2 1 9 1 * 0.15
in splay sig 1 1 0 True
