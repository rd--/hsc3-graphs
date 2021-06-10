; warp1
(let ((b (ctl kr "buf" 0))
      (p (LinLin (LFSaw kr 0.05 0) -1 1 0 1))
      (x (MouseX kr 0.5 2 0 0.1)))
  (Warp1 1 b p x 0.1 -1 8 0.1 2))
