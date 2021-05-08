; mantissamask
(let ((s (Mul (SinOsc ar (MulAdd (SinOsc kr 0.2 0) 400 500) 0) 0.1)))
  (MantissaMask s 3))
