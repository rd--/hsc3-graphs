-- ring3
let a = fSinOsc AR 800 0
    b = fSinOsc AR (xLine KR 200 500 5 DoNothing) 0
in ring3 a b * 0.125
