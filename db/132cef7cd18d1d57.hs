-- tanh
let e = xLine kr 0.1 10 10 DoNothing
    o = fSinOsc ar 500 0.0
in tanh (o * e) * 0.25
