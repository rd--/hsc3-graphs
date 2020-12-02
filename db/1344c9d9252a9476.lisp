; saw ; band limited sawtooth wave generator
(let ((f (x-line kr 40 4000 6 do-nothing)))
  (mul (saw ar f) 0.05))
