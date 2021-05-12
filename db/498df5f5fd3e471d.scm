; texprand
(let* ((t (Dust kr 10))
       (f (TExpRand 300 3000 t)))
  (Mul (SinOsc ar f 0) 0.05))
