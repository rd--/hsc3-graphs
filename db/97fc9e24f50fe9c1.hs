-- shaper ; sound in ; mouse control ; warning=feedback
let z = soundIn 0
    x = mouseX kr (-1) 1 Linear 0.2
    t = asLocalBuf (Gen.chebyShaperTbl 256 [1, 0, 1, 1, 0, 1])
in xFade2 z (shaper t z) x 0.5
