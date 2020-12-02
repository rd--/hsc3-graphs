; lf-cub
(let ((f (mul-add (lf-cub kr (mul-add (lf-cub kr 0.2 0) 8 10) 0) 400 800)))
  (mul (lf-cub ar f 0) 0.1))
