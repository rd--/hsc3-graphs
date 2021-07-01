-- osc ; requires=tbl ; as phase modulator
let b = control kr "tbl" 0
    p = osc ar b (xLine kr 20 8000 10 RemoveSynth) 0 * 2 * pi
in osc ar b 800 p * 0.1
