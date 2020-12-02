; c-osc ; requires=wavetable
(let ((b (ctl kr "tbl" 10))) (mul (c-osc ar b 200 0.7) 0.1))
