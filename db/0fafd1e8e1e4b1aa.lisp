; index
(let* ((b (as-local-buf (list 50 100 200 400 800 1600)))
       (f (mul (index b (mul (lf-saw kr 2 3) 4)) (mce2 1 9))))
  (mul (sin-osc ar f 0) 0.05))
