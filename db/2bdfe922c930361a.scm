; toggleff
(let* ((t (Dust ar (XLine kr 1 1000 60 do-nothing)))
       (s (SinOsc ar (MulAdd (ToggleFF t) 400 800) 0)))
  (Mul s 0.05))
