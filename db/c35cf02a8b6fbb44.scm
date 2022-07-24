; Pulse ; modulate frequency
(let ((f (XLine 40 4000 6 removeSynth)))
  (Mul (Pulse f 0.1) 0.05))
