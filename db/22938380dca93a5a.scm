; vibrato ; mce
(let ((v (Vibrato ar (DC ar (Mce2 (Mce2 411 440) (Mce2 419 440.5))) 1 0.02 0 0 0.04 0.1 0 0)))
  (Mix (Mul (SinOsc ar v 0) 0.1)))
