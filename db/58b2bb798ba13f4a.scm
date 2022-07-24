; vibrato ; mce
(let ((v (Vibrato (DC (Mce2 400 440.5)) 1 0.02 0 0 0.04 0.1 0 0)))
  (Mul (SinOsc v 0) 0.1))
