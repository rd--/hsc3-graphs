; osc ; modulate phase
(let* ((b (ctl kr "tbl" 10))
       (f (x-line kr 20 8000 10 remove-synth))
       (p (mul (osc ar b f 0) (* 2 pi))))
  (mul (osc ar b 800 p) 0.1))
