; trunc
(let* ((x (mouse-x kr 60 4000 0 0.1))
       (f (trunc x 100)))
  (mul (sin-osc ar f 0) 0.1))
