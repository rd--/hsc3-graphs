; OscN ; c.f. osc ; requires=tbl
(let ((b (ctl "tbl" 10))
      (f (XLine 2000 200 1 removeSynth)))
  (Mul (OscN b f 0) 0.1))
