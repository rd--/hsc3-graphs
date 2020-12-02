; round-up
(let ((n (line kr 24 108 6 remove-synth)))
  (mul (saw ar (midi-cps (round-up n 1))) 0.05))
