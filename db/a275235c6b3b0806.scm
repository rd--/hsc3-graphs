; grainbuf
(let* ((b (ctl kr "buf" 0))
       (x (MouseX kr -1 1 0 0.1))
       (y (MouseY kr 10 45 0 0.1))
       (i (Impulse kr y 0))
       (r (LinLin (LFNoise1 kr 500) -1 1 0.5 2))
       (p (LinLin (LFNoise2 kr 0.1) -1 1 0 1)))
  (GrainBuf 2 i 0.1 b r p 2 x -1 512))
