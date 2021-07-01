-- osc ; requires=tbl ; as frequency modulator
let b = control kr "tbl" 0
    f = osc ar b (xLine kr 1 1000 9 RemoveSynth) 0 * 200 + 800
in osc ar b f 0 * 0.1
