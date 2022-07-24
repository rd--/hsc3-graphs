; timer
(let* ((t (Impulse (MouseX 0.5 20 1 0.1) 0))
       (s (SinOsc (MulAdd (Timer t) 500 500) 0)))
  (Mul s 0.2))
