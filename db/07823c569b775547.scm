; GrainFM
(let* ((x (MouseX -0.5 0.5 0 0.1))
       (y (MouseY 0 400 0 0.1))
       (n (WhiteNoise))
       (fd (Add 440 (Mul n y)))
       (t (Impulse 10 0))
       (i (LinLin (LfNoise1 500) -1 1 1 10)))
  (Mul (GrainFM 2 t 0.1 fd 200 i x -1 512) 0.05))
