-- osc1 ; requires=tbl ; composite UGen
let b0 = control KR "tbl0" 0
    b1 = control KR "tbl1" 1
    env = linLin (osc1 AR (mce2 b0 b1) 8 RemoveSynth) (-1) 1 0 1
in lfSaw AR (mce2 110 164) 0 * env * 0.1
