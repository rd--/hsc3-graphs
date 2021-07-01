-- varSaw
let f = lfPulse kr (mce2 3 3.03) 0 0.3 * 200 + 200
    w = linLin (lfTri kr 1 0) (-1) 1 0 1
in varSaw ar f 0 w * 0.1
