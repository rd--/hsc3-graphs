; grain-buf
(let* ((b (ctl kr "buf" 0))
       (x (mouse-x kr -1 1 0 0.1))
       (y (mouse-y kr 10 45 0 0.1))
       (i (impulse kr y 0))
       (r (lin-lin (lf-noise1 kr 500) -1 1 0.5 2))
       (p (lin-lin (lf-noise2 kr 0.1) -1 1 0 1)))
  (grain-buf 2 i 0.1 b r p 2 x -1 512))
