; trand
(let* ((t (Dust kr (mce2 5 12)))
       (f (TRand (mce2 200 1600) (mce2 500 3000) t)))
  (Mul (SinOsc ar f 0) 0.05))
