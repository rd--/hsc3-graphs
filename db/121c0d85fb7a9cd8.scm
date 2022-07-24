; Pulse ; modulate Pulse width
(let ((w (Line 0.01 0.99 8 removeSynth)))
  (Mul (Pulse 200 w) 0.05))
