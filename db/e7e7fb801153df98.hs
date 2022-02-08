-- osc1 ; composite UGen
let tbl0 = asLocalBuf (Gen.sine1Tbl 2048 (map recip [13, 8, 55, 34, 5, 21, 3, 1, 2]))
    tbl1 = asLocalBuf (Gen.sine1Tbl 2048 (map recip [55, 34, 1, 3, 2, 13, 5, 8, 21]))
    env = linLin (osc1 ar (mce2 tbl0 tbl1) 8 RemoveSynth) (-1) 1 0 1
in lfSaw ar (mce2 110 164) 0 * env * 0.1
