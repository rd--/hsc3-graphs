; warp1
(let ((b (ctl "buf" 0))
      (p (LinLin (LfSaw 0.05 0) -1 1 0 1))
      (x (MouseX 0.5 2 0 0.1)))
  (Warp1 1 b p x 0.1 -1 8 0.1 2))
