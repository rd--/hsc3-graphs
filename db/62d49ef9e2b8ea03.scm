; trand
(let* ((t (Dust (Mce2 5 12)))
       (f (TRand (Mce2 200 1600) (Mce2 500 3000) t)))
  (Mul (SinOsc f 0) 0.05))
