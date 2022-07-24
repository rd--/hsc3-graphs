; COsc ; requires=wavetable
(let ((b (ctl "tbl" 10))) (Mul (COsc b 200 0.7) 0.1))
