-- varSaw
let f = lfPulse KR (mce2 3 3.03) 0 0.3 * 200 + 200
    w = linLin (lfTri KR 1 0) (-1) 1 0 1
in varSaw AR f 0 w * 0.1
