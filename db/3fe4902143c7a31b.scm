; Osc ; modulate freq
(let* ((b (ctl "tbl" 10))
       (f1 (XLine 1 1000 9 removeSynth))
       (f2 (MulAdd (Osc b f1 0) 200 800)))
  (Mul (Osc b f2 0) 0.1))
