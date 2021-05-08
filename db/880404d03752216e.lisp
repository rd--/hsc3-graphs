; round
(let ((n (Line kr 24 108 6 remove-synth)))
  (Mul (Saw ar (MIDICPS (Round n 1))) 0.05))
