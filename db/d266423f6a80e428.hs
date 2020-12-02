-- osc ; requires=tbl ; fixed frequency wavetable oscillator
let b = control KR "tbl" 0
in osc AR b 220 0 * 0.1
