; vibrato ; mce
(let ((v (Vibrato ar (DC ar (mce2 400 440.5)) 1 0.02 0 0 0.04 0.1 0 0)))
  (Mul (SinOsc ar v 0) 0.1))
