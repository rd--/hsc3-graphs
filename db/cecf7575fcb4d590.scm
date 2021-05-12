; Osc ; modulate phase
(let* ((b (ctl kr "tbl" 10))
       (f (XLine kr 20 8000 10 remove-synth))
       (p (Mul (Osc ar b f 0) (* 2 pi))))
  (Mul (Osc ar b 800 p) 0.1))
