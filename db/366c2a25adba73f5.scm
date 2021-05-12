; Saw ; two band limited sawtooth waves Thru a resonant low pass filter
(let ((f (XLine kr 8000 400 5 do-nothing)))
  (RLPF (Mul (Saw ar (mce2 100 250)) 0.05) f 0.05))
