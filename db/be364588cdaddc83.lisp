; Pulse ; modulate Pulse width
(let ((w (Line kr 0.01 0.99 8 remove-synth)))
  (Mul (Pulse ar 200 w) 0.05))
