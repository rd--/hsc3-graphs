; cps-midi
(let ((f (Line kr 600 900 5 remove-synth)))
  (Mul (Saw ar (MIDICPS (CPSMIDI f))) 0.05))
