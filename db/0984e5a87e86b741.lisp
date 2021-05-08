; COsc ; requires=wavetable
(let ((b (ctl kr "tbl" 10))) (Mul (COsc ar b 200 0.7) 0.1))
