; SinOsc ; c.f. lf-cub
(let ((f (MulAdd (SinOsc kr (MulAdd (SinOsc kr 0.2 0) 8 10) 0) 400 800)))
  (Mul (SinOsc ar f 0) 0.1))
