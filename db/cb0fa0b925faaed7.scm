; GrainBuf
(let* ((b (ctl "buf" 0))
       (x (MouseX -1 1 0 0.1))
       (y (MouseY 10 45 0 0.1))
       (i (Impulse y 0))
       (r (LinLin (LfNoise1 500) -1 1 0.5 2))
       (p (LinLin (LfNoise2 0.1) -1 1 0 1)))
  (GrainBuf 2 i 0.1 b r p 2 x -1 512))
