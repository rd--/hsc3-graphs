; t-exp-rand
(let* ((t (dust kr 10))
       (f (t-exp-rand 300 3000 t)))
  (mul (sin-osc ar f 0) 0.05))
