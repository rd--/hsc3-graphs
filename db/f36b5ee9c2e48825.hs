-- ring1
let a = fSinOsc ar 800 0
    b = fSinOsc ar (xLine kr 200 500 5 DoNothing) 0
in ring1 a b * 0.125
