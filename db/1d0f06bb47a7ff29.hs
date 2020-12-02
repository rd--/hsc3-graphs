-- cOsc ; compare with plain osc ; requires=tbl
let f g = g AR (control KR "tbl" 0) 200 (mouseX KR 0 4 Linear 0.2)
in xFade2 (f cOsc) (f osc) (lfTri KR 0.1 0) 0.1
