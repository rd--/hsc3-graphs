; OscN ; c.f. osc ; requires=tbl
(let ((b (ctl kr "tbl" 10))
      (f (XLine kr 2000 200 1 removeSynth)))
  (Mul (OscN ar b f 0) 0.1))
