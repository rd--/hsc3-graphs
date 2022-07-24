; Saw ; two band limited sawtooth waves Thru a resonant low pass filter
(let ((f (XLine 8000 400 5 doNothing)))
  (RLPF (Mul (Saw (Mce2 100 250)) 0.05) f 0.05))
