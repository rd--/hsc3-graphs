; ToggleFf
(let* ((t (Dust (XLn 1 1000 60)))
       (s (SinOsc (MulAdd (ToggleFf t) 400 800) 0)))
  (Mul s 0.05))
