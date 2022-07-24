; GrainIn
(let* ((x (MouseX -0.5 0.5 0 0.1))
       (y (MouseY 5 25 0 0.1))
       (n (PinkNoise))
       (t (Impulse y 0)))
  (Mul (GrainIn 2 t 0.1 n x -1 512) 0.1))
