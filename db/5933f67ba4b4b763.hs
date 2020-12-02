-- osc ; requires=tbl ; as phase modulator
let b = control KR "tbl" 0
    p = osc AR b (xLine KR 20 8000 10 RemoveSynth) 0 * 2 * pi
in osc AR b 800 p * 0.1
