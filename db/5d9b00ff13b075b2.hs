-- osc ; requires=tbl ; fixed frequency wavetable oscillator
let b = control kr "tbl" 0
in osc ar b 220 0 * 0.1
