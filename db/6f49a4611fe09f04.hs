-- ring3 ; written out
let a = fSinOsc ar 800 0
    b = fSinOsc ar (xLine kr 200 500 5 DoNothing) 0
in (a * a * b) * 0.125
