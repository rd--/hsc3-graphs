; Osc ; modulate freq
(let* ((b (ctl kr "tbl" 10))
       (f1 (XLine kr 1 1000 9 removeSynth))
       (f2 (MulAdd (Osc ar b f1 0) 200 800)))
  (Mul (Osc ar b f2 0) 0.1))
