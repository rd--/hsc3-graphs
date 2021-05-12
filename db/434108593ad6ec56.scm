; Osc ; modulate freq
(let ((b (ctl kr "tbl" 10))
      (f (XLine kr 2000 200 1 remove-synth)))
  (Mul (Osc ar b f 0) 0.1))
