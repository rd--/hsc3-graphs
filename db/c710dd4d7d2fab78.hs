-- diodeRingMod
let o1 = sinOsc ar 440 0
    o2 = sinOsc ar (xLine kr 200 500 5 DoNothing) 0
in mce2 (X.diodeRingMod o1 o2) (o1 * o2) * 0.125
