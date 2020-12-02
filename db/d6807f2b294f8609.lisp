; grain-fm
(let* ((x (mouse-x kr -0.5 0.5 0 0.1))
       (y (mouse-y kr 0 400 0 0.1))
       (n (white-noise kr))
       (fd (add 440 (mul n y)))
       (t (impulse kr 10 0))
       (i (lin-lin (lf-noise1 kr 500) -1 1 1 10)))
  (mul (grain-fm 2 t 0.1 fd 200 i x -1 512) 0.05))
