; moog-ff
(let* ((p (pulse ar (mce2 40 121) (mce2 0.3 0.7)))
       (f0 (lin-lin (lf-noise0 kr 0.43) -1 1 0.001 2.2))
       (f1 (lin-lin (sin-osc kr f0 0) -1 1 30 4200))
       (y (mouse-y kr 1 4 0 0.1)))
  (mul (moog-ff p f1 (mul 0.83 y) 0) 0.25))