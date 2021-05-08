; Osc ; change wavetable buffer while Osc is playing (see b-gen1)
(let ((b (ctl kr "tbl" 10)))
  (Mul (Osc ar b 220 0) 0.1))
