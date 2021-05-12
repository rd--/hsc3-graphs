; grainsin
(let* ((x (MouseX kr -0.5 0.5 0 0.1))
       (y (MouseY kr 0 400 0 0.1))
       (n (WhiteNoise kr))
       (f (Add 440 (Mul n y)))
       (t (Impulse kr 10 0)))
  (Mul (GrainSin 2 t 0.1 f x -1 512) 0.1))
