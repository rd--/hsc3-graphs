; AmpComp ; modulate exponent
(let* ((x (MouseX kr 300 15000 1 0.1))
       (o (Mul (Pulse ar x 0.5) 0.05)))
  (Mul o (AmpComp kr x 300 1.3)))
