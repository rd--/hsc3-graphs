; osc ; modulate freq
(let* ((b (ctl kr "tbl" 10))
       (f1 (x-line kr 1 1000 9 remove-synth))
       (f2 (mul-add (osc ar b f1 0) 200 800)))
  (mul (osc ar b f2 0) 0.1))
