; texprand
(let* ((t (Dust 10))
       (f (TExpRand 300 3000 t)))
  (Mul (SinOsc f 0) 0.05))
