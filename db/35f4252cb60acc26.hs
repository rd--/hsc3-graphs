-- lfSaw ; output range is bi-polar
let f = mce [linLin (lfSaw KR 0.5 0) (-1) 1 200 1600, 200, 1600]
    a = mce [0.1,0.05,0.05]
in mix (sinOsc AR f 0 * a)
