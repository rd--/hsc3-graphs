; mul-add ; written out
(let ((f (add (mul (lf-saw kr (mce2 10 9) 0) 200) 400)))
  (mul (sin-osc ar f 0) 0.1))
