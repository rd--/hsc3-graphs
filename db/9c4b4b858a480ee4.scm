; Osc ; modulate phase
(let* ((b (ctl "tbl" 10))
       (f (XLine 20 8000 10 removeSynth))
       (p (Mul (Osc b f 0) (* 2 pi))))
  (Mul (Osc b 800 p) 0.1))
