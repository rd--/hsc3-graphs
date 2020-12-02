; pulse ; modulate pulse width
(let ((w (line kr 0.01 0.99 8 remove-synth)))
  (mul (pulse ar 200 w) 0.05))
