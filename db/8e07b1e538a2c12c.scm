; timer
(let* ((t (Impulse kr (MouseX kr 0.5 20 1 0.1) 0))
       (s (SinOsc ar (MulAdd (Timer t) 500 500) 0)))
  (Mul s 0.2))
