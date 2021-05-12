; Saw ; band limited sawtooth wave generator
(let ((f (XLine kr 40 4000 6 do-nothing)))
  (Mul (Saw ar f) 0.05))
