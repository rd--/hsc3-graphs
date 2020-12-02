; lf-tri l c.f. lf-cub
(let ((f (mul-add (lf-tri kr (mul-add (lf-tri kr 0.2 0) 8 10) 0) 400 800)))
  (mul (lf-tri ar f 0) 0.1))
