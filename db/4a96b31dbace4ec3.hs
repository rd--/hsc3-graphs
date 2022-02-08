-- cOsc ; compare with plain osc
let tbl = asLocalBuf (Gen.sine1Tbl 256 [1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9, 1/10])
    f g = g ar tbl 200 (mouseX kr 0 4 Linear 0.2)
in xFade2 (f cOsc) (f osc) (lfTri kr 0.1 0) 0.1
