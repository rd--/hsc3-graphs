-- lag
let s = sinOsc AR 0.05 0.0
    f1 = linLin s (-1.0) 1.0 220.0 440.0
    o1 = sinOsc AR f1 0.0
    f2 = lag f1 1.0
    o2 = sinOsc AR f2 0.0
in mce2 (o1 * 0.2) (o2 * 0.2)
