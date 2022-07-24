; Saw ; band limited sawtooth wave generator
(let ((f (XLine 40 4000 6 doNothing)))
  (Mul (Saw f) 0.05))
