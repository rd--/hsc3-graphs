; grain-in
(let* ((x (MouseX kr -0.5 0.5 0 0.1))
       (y (MouseY kr 5 25 0 0.1))
       (n (PinkNoise ar))
       (t (Impulse kr y 0)))
  (Mul (GrainIn 2 t 0.1 n x -1 512) 0.1))
