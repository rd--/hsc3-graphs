-- ring4
let a = fSinOsc AR 800 0
    b = fSinOsc AR (xLine KR 200 500 5 DoNothing) 0
in ring4 a b * 0.125
