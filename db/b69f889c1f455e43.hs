-- MiTides ; shape
let shape = lfTri ar 0.11 0 `in_range` (0,1)
    c0 = mceChannel 0
in c0 (X.miTides ar 100 shape 0.5 0.5 0.2 0 0 {-output_mode:-} 2 1 9 1) * 0.25
