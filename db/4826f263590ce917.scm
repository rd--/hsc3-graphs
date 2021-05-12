; grainfm
(let* ((x (MouseX kr -0.5 0.5 0 0.1))
       (y (MouseY kr 0 400 0 0.1))
       (n (WhiteNoise kr))
       (fd (Add 440 (Mul n y)))
       (t (Impulse kr 10 0))
       (i (lin-lin (LFNoise1 kr 500) -1 1 1 10)))
  (Mul (GrainFM 2 t 0.1 fd 200 i x -1 512) 0.05))
