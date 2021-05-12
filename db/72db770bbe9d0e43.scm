; Pulse ; modulate frequency
(let ((f (XLine kr 40 4000 6 remove-synth)))
  (Mul (Pulse ar f 0.1) 0.05))
