-- tanh
let e = xLine KR 0.1 10 10 DoNothing
    o = fSinOsc AR 500 0.0
in tanh (o * e) * 0.25
