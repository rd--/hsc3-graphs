-- shaper ; mouse control ; requires=tbl
let z = soundIn 0
    x = mouseX KR (-1) 1 Linear 0.2
in xFade2 z (shaper (control KR "tbl" 10) z) x 0.5
