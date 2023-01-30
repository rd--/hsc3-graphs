; ToggleFf
(let* ((t (Impulse 15 0))
       (g (ToggleFf t)))
  (Pan2
   (SinOsc (TRand 1440 1490 t) 0)
   (TRand -0.15 0.15 t)
   (Mul (Lag g 0.01) (TRand 0.25 0.55 t))))
