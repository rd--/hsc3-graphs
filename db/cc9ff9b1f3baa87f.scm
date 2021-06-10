; Saw ; band limited sawtooth wave generator
(let ((f (XLine kr 40 4000 6 doNothing)))
  (Mul (Saw ar f) 0.05))
