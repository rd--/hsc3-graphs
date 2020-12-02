-- MiTides ; chords ; tremolo
let shape = lfTri AR 0.11 0 `in_range` (0,1)
    slope_ = lfTri AR 0.2 0 `in_range` (0,1);
    chord = lfNoise1 'α' AR 0.1 `in_range` (0.5,1);
    smooth = sinOsc AR (lfNoise1 'β' KR 0.2 `in_range` (0.1,10)) 0 `in_range` (0,0.5)
    sig = X.miTides AR 200 shape slope_ smooth chord 0 0 {-output_mode:-} 3 1 9 1 * 0.25
in splay sig 1 1 0 True
