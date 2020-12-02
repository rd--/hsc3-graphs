-- osc ; requires=tbl ; as frequency modulator
let b = control KR "tbl" 0
    f = osc AR b (xLine KR 1 1000 9 RemoveSynth) 0 * 200 + 800
in osc AR b f 0 * 0.1
