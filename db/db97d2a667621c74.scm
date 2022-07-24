; toggleff
(let* ((t (Dust (XLine 1 1000 60 doNothing)))
       (s (SinOsc (MulAdd (ToggleFF t) 400 800) 0)))
  (Mul s 0.05))
