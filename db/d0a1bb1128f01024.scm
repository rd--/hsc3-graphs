; Osc ; change wavetable buffer while Osc is playing (see b-gen1)
(let ((b (ctl "tbl" 10)))
  (Mul (Osc b 220 0) 0.1))
