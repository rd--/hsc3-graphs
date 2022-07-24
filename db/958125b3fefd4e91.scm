; mantissamask
(let ((s (Mul (SinOsc (MulAdd (SinOsc 0.2 0) 400 500) 0) 0.1)))
  (MantissaMask s 3))
