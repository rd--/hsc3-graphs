; saw ; two band limited sawtooth waves thru a resonant low pass filter
(let ((f (x-line kr 8000 400 5 do-nothing)))
  (rlpf (mul (saw ar (mce2 100 250)) 0.05) f 0.05))
