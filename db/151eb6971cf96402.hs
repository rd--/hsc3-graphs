-- cOsc ; compare with plain osc ; requires=tbl
let f g = g ar (control kr "tbl" 0) 200 (mouseX kr 0 4 Linear 0.2)
in xFade2 (f cOsc) (f osc) (lfTri kr 0.1 0) 0.1
