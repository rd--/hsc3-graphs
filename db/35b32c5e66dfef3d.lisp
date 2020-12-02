; fos ; same as one-zero
(let ((x (mul (lf-tri ar 0.4 0) 0.99))
      (i (mul (lf-saw ar 200 0) 0.1)))
  (fos i (sub 1 (u:abs x)) x 0))
