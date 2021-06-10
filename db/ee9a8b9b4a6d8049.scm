; impulse
(let ((f (XLine kr 800 10 5 removeSynth)))
  (Mul (Impulse ar f 0.0) 0.1))
