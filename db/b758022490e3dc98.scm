; cps-midi
(let ((f (Line kr 600 900 5 removeSynth)))
  (Mul (Saw ar (MIDICPS (CPSMIDI f))) 0.05))
