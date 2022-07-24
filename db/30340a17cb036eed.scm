; AmpComp ; modulate exponent
(let* ((x (MouseX 300 15000 1 0.1))
       (o (Mul (Pulse x 0.5) 0.05)))
  (Mul o (AmpComp x 300 1.3)))
