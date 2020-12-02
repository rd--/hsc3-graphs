; ti-rand
(let ((f (mul-add (ti-rand 4 12 (dust kr 10)) 150 (mce2 0 1))))
  (mul (sin-osc ar f 0) 0.05))
