; Pulse ; modulate Pulse width
(let ((w (Line kr 0.01 0.99 8 removeSynth)))
  (Mul (Pulse ar 200 w) 0.05))
