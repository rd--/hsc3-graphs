-- diodeRingMod
let o1 = sinOsc AR 440 0
    o2 = sinOsc AR (xLine KR 200 500 5 DoNothing) 0
in mce2 (X.diodeRingMod o1 o2) (o1 * o2) * 0.125
