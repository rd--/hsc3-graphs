; RoundUp
(let* ((x (MouseX 60 4000 0 0.1))
       (f (RoundUp x 100)))
  (Mul (SinOsc f 0) 0.05))
