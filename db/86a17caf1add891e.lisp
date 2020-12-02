; warp1
(let ((b (ctl kr "buf" 0))
      (p (lin-lin (lf-saw kr 0.05 0) -1 1 0 1))
      (x (mouse-x kr 0.5 2 0 0.1)))
  (warp1 1 b p x 0.1 -1 8 0.1 2))
