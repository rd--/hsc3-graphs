; osc-n ; c.f. osc
(let ((b (ctl kr "tbl" 10))
      (f (x-line kr 2000 200 1 remove-synth)))
  (mul (osc-n ar b f 0) 0.1))
