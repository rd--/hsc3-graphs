; osc ; requires=wavetable (see b-gen1)
(let ((b (ctl kr "tbl" 10)))
  (mul (osc ar b 220 0) 0.1))
