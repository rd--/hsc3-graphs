-- shaper ; wave shape external signal ; requires=tbl
let z = soundIn 0
    x = sinOsc KR (1/4) 0
in xFade2 z (shaper (control KR "tbl" 10) z) x 0.5
