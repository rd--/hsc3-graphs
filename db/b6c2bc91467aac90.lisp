; pulse ; modulate frequency
(let ((f (x-line kr 40 4000 6 remove-synth)))
  (mul (pulse ar f 0.1) 0.05))
