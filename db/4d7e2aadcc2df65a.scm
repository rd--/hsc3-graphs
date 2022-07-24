; Osc ; modulate freq
(let ((b (ctl "tbl" 10))
      (f (XLine 2000 200 1 removeSynth)))
  (Mul (Osc b f 0) 0.1))
